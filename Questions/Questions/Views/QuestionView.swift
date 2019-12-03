//
// Created by mac on 12/1/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation
import SnapKit

class QuestionView: UIView {
    var question: Question! { didSet { draw() } }

    required init(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(question: Question) {
        self.init()
        self.question = question
    }

    func draw() {
        var view: QuestionViewProtocol

        switch question.questionType {
        case .text:
            view = TitleView()
            add(view: view)

        case .number:
            view = StepperView()
            add(view: view)
            return

        case .undefined:
           return
        }
        view.setup(question: question, viewType: .question)
    }
}

// MARK: add view
extension QuestionView {

    private func add(view: UIView) {
        addSubview(view)
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()
            make.height.lessThanOrEqualToSuperview()
        }
    }

    private func drawText() {

    }
}
