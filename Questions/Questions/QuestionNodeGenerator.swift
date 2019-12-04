//
// Created by mac on 12/4/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Data
import Presentation
import Eureka

func nodeRows(node: QuestionNode) -> [BaseRow] {
    var rows: [BaseRow] = [node.row]
    node.nodes.forEach { item in rows.append(contentsOf: nodeRows(node: item)) }
    return rows
}

func uniqueTag(question: Question) -> String { "\(question.id)-\(question.title)" }

class QuestionNodeGenerator {

    func generateNode(question: Question, parent: Question?, form: Form) -> QuestionNode {
        let row: BaseRow = generateRow(question: question, parent: parent, form: form)

        var nodes: [QuestionNode] = []
        for value in question.values { nodes.append(generateNode(question: value, parent: question, form: form)) }
        for addon in question.addons { nodes.append(generateNode(question: addon, parent: question, form: form)) }

        let node = QuestionNode(question: question, row: row, nodes: nodes)

        if let selectable = row as? CheckRow {
            toggleSelectableNodesVisibility(selectable: selectable, node: node)
        }

        return node
    }

    private func toggleSelectableNodesVisibility(selectable: CheckRow, node: QuestionNode) {
        // hide nodes of selectable row by default, and show if the row is selected
        for node in node.nodes {
            node.row.hidden = .function([selectable.tag!], { form in !(selectable.value ?? false) })
            toggleSelectableNodesVisibility(selectable: selectable, node: node)
        }
    }

    private func generateRow(question: Question, parent: Question?, form: Form) -> BaseRow {
        switch question.questionType {

        case .text:
            return LabelRow() {
                $0.tag = uniqueTag(question: question)
                $0.title = question.title
            }

        case .number:
            return StepperRow() { row in
                row.tag = uniqueTag(question: question)
                row.title = question.title
                row.cell.valueLabel.isHidden = true
                row.onChange { stepper in
                    let allRows = form.allRows
                    // update value field
                    if let currentIndex = row.indexPath?.row, currentIndex + 1 < allRows.count {
                        let valueRow = allRows[currentIndex + 1]
                        if let textRow = valueRow as? TextRow  {
                            textRow.value = String(stepper.value!)
                            textRow.updateCell()
                        }
                    }
                }
            }

        case .undefined:
            // it's a value, should be displayed according to parent input type
            switch parent!.inputType {
            case .select, .checkbox:
                if parent!.multipleSelect {
                    return CheckRow() {
                        $0.tag = uniqueTag(question: question)
                        $0.title = question.title
                    }
                }
                return ImageCheckRow<String>(uniqueTag(question: question)) { lrow in
                    lrow.title = question.title
                    lrow.selectableValue = question.title
                    lrow.value = nil
                }
            case .text:
                return TextRow() {
                    $0.tag = uniqueTag(question: question)
                    $0.title = question.title
                }
            case .undefined:
                fatalError()
            }
        }
    }
}
