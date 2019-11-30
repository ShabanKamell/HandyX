//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct SubService {
    public let id: Int
    public let parent: String
    public let name: String
    public let providerName: String?
    public let image: String?
    public let fixed: String
    public let price: String
    public let subServiceDescription: String?
    public let status: String
    public let bidCount: String
    public let routeType: String

}

public struct SubServiceMapper: Mapper {
    public typealias I = SubServiceDto
    public typealias O = SubService

    public init() {}

    public func map(_ input: SubServiceDto) -> SubService {
        SubService(id: input.id,
                parent: input.parent,
                name: input.name,
                providerName: input.providerName,
                image: input.image,
                fixed: input.fixed,
                price: input.price,
                subServiceDescription: input.subServiceDescription,
                status: input.status,
                bidCount: input.bidCount,
                routeType: input.routeType
        )
    }
}