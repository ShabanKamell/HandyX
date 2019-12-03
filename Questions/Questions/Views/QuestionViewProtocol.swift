//
// Created by mac on 12/2/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data

protocol QuestionViewProtocol where Self: UIView {
    var stackView: UIStackView! { get set }
    var question: Question! { get set }
    var children: [QuestionViewProtocol] { get set }
    func setup(question: Question, viewType: QuestionViewType)
    func setupQuestion()
    func setupChildren()
    func add(child: Question)
    func removeChild()
}

extension QuestionViewProtocol {

    func setup(question: Question, viewType: QuestionViewType) {

        self.question = question

        switch viewType {
        case .question:
            setupQuestion()
            setupChildren()
        case .value:
            // values will be setup only when the user clicks the value
            setupQuestion()
        }
    }

    func setupChildren() {
        question.values.forEach { item in add(child: item) }
        stackView.addArrangedSubview(UIView(frame: CGRect.zero))
    }

    func removeChild() {
       let last = children.popLast()
        guard let lastChild = last else { return }
        stackView.removeArrangedSubview(lastChild)
    }

    func add(child: Question) {
        var view: QuestionViewProtocol

        switch question.inputType {
        case .select:
            view = CheckBoxView()

        case .text:
            view = TitleView()

        case .checkbox:
            view = CheckBoxView()

        case .undefined:
            fatalError()
        }
        (view as UIView).translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view)
        view.setup(question: child, viewType: .value)
        let arrangedViews = stackView.arrangedSubviews
        children.append(view)
    }
}
