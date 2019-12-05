//
// Created by mac on 12/5/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct QuestionAnswer: Encodable {
    let id: Int
    let values: [QuestionAnswer]
    let addons: [QuestionAnswer]

    public init(id: Int, values: [QuestionAnswer], addons: [QuestionAnswer]) {
        self.id = id
        self.values = values
        self.addons = addons
    }
}

public struct QuestionAnswerMapper: Mapper {
    public typealias I = Question
    public typealias O = QuestionAnswer

    public init() {}

    public func map(_ input: Question) -> QuestionAnswer {
        QuestionAnswer(
                id: input.id,
                values: ListMapper(QuestionAnswerMapper()).map(input.values),
                addons: ListMapper(QuestionAnswerMapper()).map(input.addons))
    }
}