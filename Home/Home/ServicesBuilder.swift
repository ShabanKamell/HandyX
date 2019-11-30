//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import RxRequester
import Data

struct ServicesBuilder {

    static func make() -> ServicesViewController {
        let vc = StoryboardScene.Services.initialScene.instantiate()

        let vm = ServicesViewModel(rxRequester: RxRequester(presentable: vc),
                servicesRepository: ServicesRepositoryBuilder.make())
        vc.vm = vm
        return vc
    }

}
