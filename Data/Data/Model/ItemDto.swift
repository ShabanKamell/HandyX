//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

class ItemDto<T: Decodable>: Decodable {
    let data: T
}
