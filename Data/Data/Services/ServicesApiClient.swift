//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Core

typealias ServicesApiProvider = MoyaProvider<ServicesApi>

enum ServicesApi {
    case services
    case subServices(Int)
    case questions(Int)
}

extension ServicesApi: TargetType {
    var path: String {
        switch self {

        case .services:
            return "/user/services"

        case .subServices(let id):
            return "/user/service/\(id)/sub_services"

        case .questions(let id):
            return "/user/service/\(id)/questions/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .services, .subServices, .questions:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .services, .subServices, .questions:
            return .requestPlain
        }
    }

    var baseURL: URL { URL(string: "http://snow.webjobsuk.com/handyx/api")! }
    var validationType: ValidationType { .none }
    var sampleData: Data { Data() }
    var headers: [String: String]? { nil }
    var parameters: [String: Any]? { nil }
}

