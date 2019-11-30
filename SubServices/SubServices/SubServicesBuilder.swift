//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Data
import RxRequester

struct SubServicesBuilder {

    static func make(serviceId: Int) -> SubServicesViewController {
        let vc = StoryboardScene.SubServices.initialScene.instantiate()
        var vm = SubServicesViewModel(rxRequester: RxRequester(presentable: vc),
                servicesRepository: ServicesRepositoryBuilder.make())
        vc.vm = vm
        vm.serviceId = serviceId
        return vc
    }

}
