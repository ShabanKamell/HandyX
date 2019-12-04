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

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }

    private func setupForm(questions: [Question]) {
        for question in questions {
            form +++ Section()
            let node = QuestionNodeGenerator().generateNode(question: question, parent: nil, form: form)
            draw(node: node)
        }
    }

    private func draw(node: QuestionNode) {
        let isSelectable = !node.nodes.isEmpty && node.nodes.allSatisfy { item in item.row is ImageCheckRow<String> }

        if isSelectable {
            let section = SelectableSection<ImageCheckRow<String>>(node.question.title,
                    selectionType: .singleSelection(enableDeselection: false)) { section in
                section.hidden = node.nodes[0].row.hidden
            }
            // no need to recursion here as selectable nodes don't have nodes
            for childNode in node.nodes { section <<< childNode.row }
            form +++ section
        } else {
            form.last! <<< node.row
            for childNode in node.nodes { draw(node: childNode) }
        }
    }

    func loadQuestions() {
        vm.questions()
                .subscribe(onSuccess: { [weak self] questions in
                    guard let self = self else { return }
                    self.setupForm(questions: questions)
                })
                .disposed(by: disposeBag)
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

