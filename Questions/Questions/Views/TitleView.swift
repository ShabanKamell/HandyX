//
// Created by mac on 12/2/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Presentation
import Data

class TitleView: NibView, QuestionViewProtocol {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet var stackView: UIStackView!
    var question: Question!
    var children: [QuestionViewProtocol] = []

    func setupQuestion() {
        lblTitle.text = question.title
    }
}
