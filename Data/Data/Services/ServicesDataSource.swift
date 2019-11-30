//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import RxSwift

class ServicesDataSource {
    private let api: ServicesApiProvider!

    init(api: ServicesApiProvider!) {
        self.api = api
    }

    public func services() -> Single<[ServiceDto]> {
        api.rx.request(.services).mapList()
    }

    public func subServices(serviceId: Int) -> Single<[SubServiceDto]> {
        api.rx.request(.subServices(serviceId)).mapList()
    }

    public func questions(subServiceId: Int) -> Single<[QuestionDto]> {
        api.rx.request(.questions(subServiceId)).mapList()
    }
}
