//
// Created by mac on 12/2/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public extension NSObject {
    var className: String {
        NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? ""
    }

    public class var className: String {
        NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}