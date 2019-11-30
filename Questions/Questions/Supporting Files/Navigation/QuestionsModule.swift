//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Dependencies
import Data

public class QuestionsModule: QuestionsModuleProtocol {

    public init() { }

    public func questionsScreen(subServiceId: Int) -> UIViewController {
        QuestionsBuilder.make(subServiceId: subServiceId)
    }

}
