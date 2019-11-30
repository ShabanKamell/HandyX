//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

public enum Identifier: String {
    case serviceCell = "ServiceCell"
    case subServiceCell = "SubServiceCell"
    case questionCell = "QuestionCell"

    func nib(bundle: Bundle) -> UINib {
        UINib(nibName: self.rawValue, bundle: bundle)
    }

    func view<T: UIView>() -> T {
        UINib(nibName: self.rawValue, bundle: nil)
                .instantiate(withOwner: self.rawValue, options: nil).first
                as! T
    }


}
