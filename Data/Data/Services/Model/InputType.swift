//
// Created by mac on 12/1/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public enum InputType: String {
    case text = "text"
    case select = "select"
    case checkbox = "checkbox"
    case undefined = ""

    static func from(rawValue: String?) -> InputType {
        guard let value = rawValue else { return .undefined }
        return InputType(rawValue: value)!
    }
}
