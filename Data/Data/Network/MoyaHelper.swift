//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Moya

struct MoyaHelper {

    static func provider<T: TargetType>() -> MoyaProvider<T> {
        var config = NetworkLoggerPlugin.Configuration()

        // Log Options
        var logOptions = NetworkLoggerPlugin.Configuration.LogOptions()
        logOptions.insert(NetworkLoggerPlugin.Configuration.LogOptions.verbose)
        config.logOptions = logOptions

        // Formatter
        config.formatter = NetworkLoggerPlugin.Configuration.Formatter(responseData: jsonResponseDataFormatter)

        let logger = NetworkLoggerPlugin(configuration: config)

        return MoyaProvider<T>(plugins: [logger])
    }

    private static func jsonResponseDataFormatter(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(decoding: prettyData, as: UTF8.self)
        } catch { return String(decoding: data, as: UTF8.self) }
    }
}

func url(_ route: TargetType) -> String { route.baseURL.appendingPathComponent(route.path).absoluteString }

// MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

private extension String {
    var urlEscaped: String { self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! }
}
