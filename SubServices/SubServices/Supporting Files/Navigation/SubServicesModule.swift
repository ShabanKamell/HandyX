//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Dependencies
import Data

public class SubServicesModule: SubServicesModuleProtocol {

    public init() { }

    public func subServicesScreen(serviceId: Int) -> UIViewController {
        SubServicesBuilder.make(serviceId: serviceId)
    }

}
