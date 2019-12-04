//
// Created by mac on 12/4/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Data
import Presentation
import Eureka

private enum NodeType {
    case values
    case addons
}

class QuestionNodeGenerator {

    func generateNode(question: Question, parent: Question?) -> QuestionNode {
        let row: BaseRow = generateRow(question: question, parent: parent)

        var nodes: [QuestionNode] = []
        for value in question.values { nodes.append(generateNode(question: value, parent: question)) }
        for addon in question.addons { nodes.append(generateNode(question: addon, parent: question)) }

        return QuestionNode(row: row, nodes: nodes)
    }

/*
    func generate(question: Question, parent: Question?) -> QuestionNode {
        let row: BaseRow = generateRow(question: question, parent: parent)

        var nodes: [QuestionNode] = []
        for value in question.values { nodes.append(generate(question: value, parent: question)) }

        return QuestionNode(row: row, nodes: nodes)
    }
*/

    private func generateNode(question: Question, parent: Question?, for type: NodeType) -> QuestionNode {
        let row: BaseRow = generateRow(question: question, parent: parent)

        var questions: [Question]
        switch type {
        case .values:
            questions = question.values
        case .addons:
            questions = question.addons
        }

        var nodes: [QuestionNode] = []
        for value in questions { nodes.append(generateNode(question: value, parent: question, for: type)) }

        return QuestionNode(row: row, nodes: nodes)
    }

    private func generateRow(question: Question, parent: Question?) -> BaseRow {
        switch question.questionType {

        case .text:
            return TextRow() { $0.title = question.title }

        case .number:
            return StepperRow() { $0.title = question.title }

        case .undefined:
            // it's a value, should be displayed according to parent input type
            switch parent!.inputType {
            case .select, .checkbox:
                return ImageCheckRow<String>(String(question.id)){ lrow in
                    lrow.title = question.title
                    lrow.selectableValue = question.title
                    lrow.value = nil
                }
            case .text:
                return TextRow() { $0.title = question.title }
            case .undefined:
                fatalError()
            }
        }
    }

    func nodeRows(node: QuestionNode) -> [BaseRow] {
        var rows: [BaseRow] = [node.row]
        node.nodes.forEach { item in rows.append(contentsOf: nodeRows(node: item)) }
        return rows
    }
}
