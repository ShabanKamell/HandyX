//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data

public protocol QuestionsModuleProtocol {
    func questionsScreen(subServiceId: Int) -> UIViewController
}

extension Dependencies {
    public var questionsModule: QuestionsModuleProtocol {
        resolve(QuestionsModuleProtocol.self)!
    }
}