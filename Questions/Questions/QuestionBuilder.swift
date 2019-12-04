//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Data
import RxRequester

struct QuestionsBuilder {

    static func make(subServiceId: Int) -> QuestionsViewController {
        let vc = QuestionsViewController()
        let vm = QuestionsViewModel(rxRequester: RxRequester(presentable: vc),
                servicesRepository: ServicesRepositoryBuilder.make())
        vc.vm = vm
        vm.subServiceId = subServiceId
        return vc
    }

}
