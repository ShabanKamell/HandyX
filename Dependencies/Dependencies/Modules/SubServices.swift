//
//  PostDetail.swift
//  Dependencies
//
//  Created by mac on 11/12/19.
//  Copyright © 2019 sha. All rights reserved.
//

import UIKit
import Data

public protocol SubServicesModuleProtocol {
    func subServicesScreen(serviceId: Int) -> UIViewController
}

extension Dependencies {
    public var subServicesModule: SubServicesModuleProtocol {
         resolve(SubServicesModuleProtocol.self)!
    }
}
