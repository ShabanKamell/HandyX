//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public protocol QuestionProtocol {
    var id: Int { get }
    var title: String { get }
}

public protocol ValueProtocol {
    var id: Int { get }
    var title: String { get }
}

public struct Question {
    public let id: Int
    public let title: String
    public let inputType: InputType
    public let questionType: QuestionType
    public let multipleSelect: Bool
    public let values: [Question]
    public let addons: [Question]
}

public struct QuestionMapper: Mapper {
    public typealias I = QuestionDto
    public typealias O = Question

    public init() {}

    public func map(_ input: QuestionDto) -> Question {
        Question(id: input.id,
                title: input.title,
                inputType: InputType.from(rawValue: input.inputType),
                questionType: QuestionType.from(rawValue: input.questionType),
                multipleSelect: input.multipleSelect == "1",
                values: NullableInputListMapper(QuestionMapper()).map(input.values),
                addons: NullableInputListMapper(QuestionMapper()).map(input.addons)
        )
    }
}

