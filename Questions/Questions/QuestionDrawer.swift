//
// Created by mac on 12/1/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import SnapKit

struct QuestionDrawer {

    static func draw(question: Question, stackView: UIStackView) {
       let view = QuestionView()

        stackView.addArrangedSubview(view)
        view.question = question
        question.values.forEach { item in draw(question: item, stackView: stackView) }
    }

}
