//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct ServiceDto: Codable {
    let id: Int
    let parent: String
    let name: String
    let providerName: String?
    let image: String
    let fixed: String
    let price: String
    let serviceDescription: String?
    let status: String
    let bidCount: String
    let routeType: String

    enum CodingKeys: String, CodingKey {
        case id, parent, name
        case providerName = "provider_name"
        case image, fixed, price
        case serviceDescription = "description"
        case status
        case bidCount = "bid_count"
        case routeType = "route_type"
    }
}