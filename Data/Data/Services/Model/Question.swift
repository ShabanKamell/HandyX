//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct Question {
    public let id: Int
    public let parentValue: String?
    public let serviceId: String
    public let title: String
    public let inputType: String
    public let questionType: String
    public let multipleSelect: String
    public let values: [QuestionsValue]?
}

public struct QuestionMapper: Mapper {
    public typealias I = QuestionDto
    public typealias O = Question

    public init() {}

    public func map(_ input: QuestionDto) -> Question {
        Question(id: input.id,
                parentValue: input.parentValue,
                serviceId: input.serviceId,
                title: input.title,
                inputType: input.inputType,
                questionType: input.questionType,
                multipleSelect: input.multipleSelect,
                values: input.values
        )
    }
}