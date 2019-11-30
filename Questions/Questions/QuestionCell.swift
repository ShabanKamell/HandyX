//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit
import Presentation
import Data
import Dependencies
import RxRequester


class QuestionCell: ConfigurableCell<Question> {

    @IBOutlet weak var lblName: UILabel!

    override func setup() {
        super.setup()
        contentView.tap(target: self, action: #selector(didTapCell))

        lblName.text = item.title
    }

    @objc
    func didTapCell() {
//        Dependencies.shared.postDetailModule.postDetailScreen(post: item!).push()
    }

}

