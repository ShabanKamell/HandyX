//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

// MARK: - Service
public struct Service {
    public let id: Int
    public let parent: String
    public let name: String
    public let providerName: String?
    public let image: String
    public let fixed: String
    public let price: String
    public let serviceDescription: String?
    public let status: String
    public let bidCount: String
    public let routeType: String
}

public struct ServiceMapper: Mapper {
    public typealias I = ServiceDto
    public typealias O = Service

    public init() {}

    public func map(_ input: ServiceDto) -> Service {
        Service(id: input.id,
                parent: input.parent,
                name: input.name,
                providerName: input.providerName,
                image: input.image,
                fixed: input.fixed,
                price: input.price,
                serviceDescription: input.serviceDescription,
                status: input.status,
                bidCount: input.bidCount,
                routeType: input.routeType
        )
    }
}