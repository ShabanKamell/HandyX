//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Dependencies

public class HomeModule : HomeModuleProtocol {

    public init() { }

    public func homeScreen() -> UIViewController {
        ServicesBuilder.make()
    }
}