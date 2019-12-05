//
// Created by mac on 12/4/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Eureka
import Data

struct QuestionNode {
    let question: Question
    let row: BaseRow
    let nodes: [QuestionNode]
    let valueNodes: [QuestionNode]
    let addonNodes: [QuestionNode]
}

struct QuestionAnswerMapper: Mapper {
    public typealias I = QuestionNode
    public typealias O = QuestionAnswer

    public init() {}

    func map(_ input: QuestionNode) -> QuestionAnswer {
        QuestionAnswer(
                id: input.question.id,
                values: ListMapper(QuestionAnswerMapper()).map(input.valueNodes),
                addons: ListMapper(QuestionAnswerMapper()).map(input.addonNodes))
    }
}