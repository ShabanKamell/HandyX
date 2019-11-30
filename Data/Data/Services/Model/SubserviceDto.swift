//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

// MARK: - SubService
public struct SubServiceDto: Codable {
    let id: Int
    let parent: String
    let name: String
    let providerName: String?
    let image: String?
    let fixed: String
    let price: String
    let subServiceDescription: String?
    let status: String
    let bidCount: String
    let routeType: String
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, parent, name
        case providerName = "provider_name"
        case image, fixed, price
        case subServiceDescription = "description"
        case status
        case bidCount = "bid_count"
        case routeType = "route_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}