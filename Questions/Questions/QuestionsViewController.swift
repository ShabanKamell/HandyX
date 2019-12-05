//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation
import Dependencies
import RxSwift
import Eureka


final class QuestionsViewController: FormViewController, ViewControllerProtocol {
    var vm: QuestionsViewModel!
    private let disposeBag = DisposeBag()
    private var nodes: [QuestionNode] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let donItem = UIBarButtonItem(
                title: "Done",
                style: .plain,
                target: self,
                action: #selector(save)
        )
        navigationItem.rightBarButtonItem = donItem

        loadQuestions()
    }

    func loadQuestions() {
        vm.questions()
                .subscribe(onSuccess: { [weak self] questions in
                    guard let self = self else { return }
                    self.setupForm(questions: questions)
                })
                .disposed(by: disposeBag)
    }

    private func setupForm(questions: [Question]) {
        TextRow.defaultCellUpdate = { cell, row in
            if !row.isValid { cell.titleLabel?.textColor = .red }
        }
        for question in questions {
            let canAddNewSection = form.last == nil || !form.last!.isEmpty
            if canAddNewSection { form +++ Section() }
            let node = QuestionNodeGenerator().generateNode(question: question, parent: nil, form: form)
            nodes.append(node)
            draw(node: node)
        }

        for section in form.allSections {
            if section.isEmpty, let index = section.index { form.remove(at: index) }
        }
    }

    private func draw(node: QuestionNode) {
        let isSelectable = !node.nodes.isEmpty && node.nodes.allSatisfy { item in item.row is ImageCheckRow<String> }

        if isSelectable {
            if form.last?.isEmpty == true { _ = form.dropLast() }
            let section = SelectableSection<ImageCheckRow<String>>(node.question.title,
                    selectionType: .singleSelection(enableDeselection: false)) { section in
                section.hidden = node.nodes[0].row.hidden
            }
            // no need to recursion here as selectable nodes don't have nodes
            for childNode in node.nodes { section <<< childNode.row }

            form +++ section
            form +++ Section()
        } else {
            form.last! <<< node.row
            for childNode in node.nodes { draw(node: childNode) }
        }
    }

    @objc func save() {
        var isValid: Bool = form.validate().isEmpty

        form.allSections
                .filter { !$0.isHidden }
                .filter { $0 is SelectableSection<ImageCheckRow<String>> }
                .forEach { section in
                    let isSectionValid = (section as! SelectableSection<ImageCheckRow<String>>).selectedRow() != nil
                    isValid = isValid && isSectionValid
                }

        print("isValid: \(isValid)")
        form.validate().forEach { error in print(error.msg) }
        print("\(form.values())")

        guard isValid else {
            showError(message: L10n.fillRequiredFields)
            return
        }

        // TODO: do the request
    }

    private func collectValues() -> [QuestionAnswer] {
        nodes.map { QuestionAnswerMapper().map($0) }
    }
}

extension QuestionsViewController: NavControllerContext {
    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
        false
    }

    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
        .withoutText
    }
}