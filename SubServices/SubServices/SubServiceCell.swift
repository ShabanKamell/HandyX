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


class SubServiceCell: ConfigurableCell<SubService> {

    @IBOutlet weak var lblName: UILabel!

    override func setup() {
        super.setup()
        contentView.tap(target: self, action: #selector(didTapCell))

        lblName.text = item.name
    }

    @objc
    func didTapCell() {
        Dependencies.shared.questionsModule.questionsScreen(subServiceId: item.id).push()
    }

}

