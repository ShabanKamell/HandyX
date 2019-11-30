//
// Created by mac on 2019-03-30.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    func mapItem<T: Decodable>() -> Single<T> {
        self.map(ItemDto<T>.self, failsOnEmptyData: false).map({dto in dto.data })
    }

    func mapList<T: Decodable>() -> Single<[T]> {
        self.map(ArrayDto<T>.self, failsOnEmptyData: false).map({dto in dto.data })
    }
}




