//
// Created by mac on 12/1/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public enum QuestionType: String {
    case text = "Text"
    case number = "Number"
    case undefined = ""

    static func from(rawValue: String?) -> QuestionType {
        guard let value = rawValue else { return .undefined }
        return QuestionType(rawValue: value)!
    }
}
