//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import UIKit


public struct QuestionDto: Decodable {
    public let id: Int
    public let questionId: String?
    public let title: String
    public let quantity: String?
    let inputType: String?
    let parent: String?
    let questionType: String?
    let multipleSelect: String?
    let values: [QuestionDto]?
    let addons: [QuestionDto]?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        quantity = try? container.decode(String.self, forKey: .quantity)
        questionId = try? container.decode(String.self, forKey: .questionId)
        parent = try? container.decode(String.self, forKey: .parent)

        inputType = try? container.decode(String.self, forKey: .inputType)
        questionType = try? container.decode(String.self, forKey: .questionType)
        multipleSelect = try? container.decode(String.self, forKey: .multipleSelect)
        addons = try? container.decode([QuestionDto].self, forKey: .addons)

        if let titleValue = try? container.decode(String.self, forKey: .title) {
            title = titleValue
        } else {
            title = try container.decode(String.self, forKey: .value)
        }

        if let array = try? container.decode([QuestionDto].self, forKey: .values) {
            values = array
        } else {
            values = try? container.decode([QuestionDto].self, forKey: .questionByValue)
        }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case value
        case questionId = "question_id"
        case quantity
        case questionByValue = "question_by_value"
        case values
        case addons
        case inputType = "input_type"
        case questionType = "question_type"
        case multipleSelect = "multiple_select"
        case parent = "parent_value"
    }
    
}
