//
// Created by mac on 12/2/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Presentation
import Data

class StepperView: NibView, QuestionViewProtocol {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stackView: UIStackView!
    var children: [QuestionViewProtocol] = []
    var question: Question!

    func setupQuestion() {
        lblTitle.text = question.title
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        lblCount.text = String(stepper.value)

    }
}
