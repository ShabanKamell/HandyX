//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

// MARK: - Question
public struct QuestionDto: Codable {
     let id: Int
     let parentValue: String?
     let serviceId: String
     let title: String
     let inputType: String
     let questionType: String
     let multipleSelect: String
     let values: [QuestionsValue]?

    enum CodingKeys: String, CodingKey {
        case id
        case parentValue = "parent_value"
        case serviceId = "service_id"
        case title
        case inputType = "input_type"
        case questionType = "question_type"
        case multipleSelect = "multiple_select"
        case values
    }
}

// MARK: - QuestionsValue
public struct QuestionsValue: Codable {
    public let id: Int
    public let questionId: String
    public let value: String
    public let quantity: String
    public let fixedPrice: String
    public let pricePerHour: String
    public let questionByValue: [QuestionByValue]?

    enum CodingKeys: String, CodingKey {
        case id
        case questionId = "question_id"
        case value, quantity
        case fixedPrice = "fixed_price"
        case pricePerHour = "price_per_hour"
        case questionByValue = "question_by_value"
    }
}

// MARK: - QuestionByValue
public struct QuestionByValue: Codable {
    public let id: Int
    public let parentValue: String
    public let serviceId: String
    public let title: String
    public let inputType: String
    public let questionType: String
    public let multipleSelect: String
    public let addons: [Addon]?
    public let values: [QuestionByValueValue]?

    enum CodingKeys: String, CodingKey {
        case id
        case parentValue = "parent_value"
        case serviceId = "service_id"
        case title
        case inputType = "input_type"
        case questionType = "question_type"
        case multipleSelect = "multiple_select"
        case addons, values
    }
}

// MARK: - Addon
public struct Addon: Codable {
    public let id: Int
    public let valueId: String
    public let questionId: String
    public let title: String
    public let inputType: String
    public let questionType: String
    public let multipleSelect: String
    public let values: [AddonValue]?

    enum CodingKeys: String, CodingKey {
        case id
        case valueId = "value_id"
        case questionId = "question_id"
        case title
        case inputType = "input_type"
        case questionType = "question_type"
        case multipleSelect = "multiple_select"
        case values
    }
}

// MARK: - AddonValue
public struct AddonValue: Codable {
    public let id: Int
    public let addonId: String
    public let value: String
    public let quantity: String
    public let fixedPrice: String
    public let pricePerHour: String

    enum CodingKeys: String, CodingKey {
        case id
        case addonId = "addon_id"
        case value, quantity
        case fixedPrice = "fixed_price"
        case pricePerHour = "price_per_hour"
    }
}

// MARK: - QuestionByValueValue
public struct QuestionByValueValue: Codable {
    public let id: Int
    public let questionId: String
    public let value: String
    public let quantity: String
    public let fixedPrice: String
    public let pricePerHour: String

    enum CodingKeys: String, CodingKey {
        case id
        case questionId = "question_id"
        case value, quantity
        case fixedPrice = "fixed_price"
        case pricePerHour = "price_per_hour"

    }
}
