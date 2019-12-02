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
        switch question.inputType {
        case .select:
            drawSelect()
        case .text:
            drawSelect()

        case .checkbox:
            drawSelect()
            return

        case .undefined:
            drawSelect()
            return
        }
    }
}

// MARK: draw
extension QuestionView {

    private func drawSelect() {
        //Stack View
//        let stackView   = UIStackView()
//        stackView.axis  = NSLayoutConstraint.Axis.horizontal
//        stackView.distribution  = UIStackView.Distribution.equalCentering
//        stackView.alignment = UIStackView.Alignment.center
//        stackView.spacing   = 16.0
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        let checkBox = CheckBox(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        stackView.addArrangedSubview(checkBox)

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = question.title
        label.numberOfLines = 0

        addSubview(label)

        label.lineBreakMode = .byWordWrapping
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.lineBreakMode = .byTruncatingTail
        label.snp.makeConstraints { make in
            make.width.lessThanOrEqualToSuperview()
            make.height.lessThanOrEqualToSuperview()
        }
        layoutIfNeeded()
    }

    private func drawText() {

    }
}
