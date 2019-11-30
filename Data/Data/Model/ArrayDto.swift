//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

struct ArrayDto<T: Decodable>: Decodable {
    var data: [T]
}
