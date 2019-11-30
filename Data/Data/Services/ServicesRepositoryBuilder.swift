//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public class ServicesRepositoryBuilder {

    public static func make() -> ServicesRepository {
        let dataSource = ServicesDataSource(api: MoyaHelper.provider())
        return ServicesRepository(dataSource: dataSource)
    }
}