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
//            setupQuestion(question: question)

            let nodeGenerator = QuestionNodeGenerator()
            let node = nodeGenerator.generateNode(question: question, parent: nil)
            for row in nodeGenerator.nodeRows(node: node) { form.last! <<< row }
        }
    }

    private func setupQuestion(question: Question) {
        switch question.questionType {
        case .text:
            // in case of checkbox/select we don't need to set a label for the question because
            // the title will be set to SelectableSection
            if ![InputType.checkbox, InputType.select].contains(question.inputType) { // <<<<< I need additional
                form.last! <<< LabelRow() { $0.title = question.title }
            }

            for item in question.values {
                setupChildren(question: item, parent: question) // <<<<< Pillow Cleaning
                setupQuestion(question: item) // <<<<< How many Pillows <<<<<<
            }

//            for item in question.addons {
//                setupChildren(question: item, parent: question) // <<<<< Pillow Cleaning
//                setupQuestion(question: item) // <<<<< How many Pillows <<<<<<
//            }
        case .number:
            form.last! <<< StepperRow() { $0.title = question.title }
            setupChildren(question: question, parent: question)

        case .undefined:
            setupChildren(question: question, parent: question)
        }
    }

    private func setupChildren(question: Question, parent: Question) {

        switch parent.inputType {
        case .select:
            setupCheckBoxRow(question: question, parent: parent) // <<<<< Show Pillow Cleaning
        case .checkbox:
            setupCheckBoxRow(question: question, parent: parent)
        case .text:
            setupTextRow(question: question, parent: parent)
        case .undefined:
            break
        }
    }

    private func setupCheckBoxRow(question: Question, parent: Question) {
        let selectionType = question.multipleSelect ? SelectionType.multipleSelection
                : SelectionType.singleSelection(enableDeselection: false)

        if !parent.multipleSelect {
            form +++ SelectableSection<ImageCheckRow<String>>(question.title, selectionType: selectionType)
        }

        form.last! <<< ImageCheckRow<String>(String(question.id)){ lrow in // <<<<< Show Pillow Cleaning
            lrow.title = question.title
            lrow.selectableValue = question.title
            lrow.value = nil
        }
//        setupChildren(question: question, parent: .value)
    }

    private func addValue(value: Question) {

    }

    private func setupTextRow(question: Question, parent: Question) {
        func addRow(item: Question) {
            form.last! <<< TextRow() { $0.title = item.title }
        }
        for item in question.values { addRow(item: item) }
        for item in question.addons { addRow(item: item) }
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

