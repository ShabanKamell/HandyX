//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public class ServicesRepository {
    private let dataSource: ServicesDataSource!

    init(dataSource: ServicesDataSource!) {
        self.dataSource = dataSource
    }

    public func services() -> Single<[ServiceDto]> {
        dataSource.services()
    }

    public func subServices(serviceId: Int) -> Single<[SubServiceDto]> {
        dataSource.subServices(serviceId: serviceId)
    }

    public func questions(subServiceId: Int) -> Single<[QuestionDto]> {
        dataSource.questions(subServiceId: subServiceId)
    }
}
