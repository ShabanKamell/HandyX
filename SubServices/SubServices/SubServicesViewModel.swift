//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation
import RxRequester

class SubServicesViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    private let servicesRepository: ServicesRepository!
    var serviceId: Int!

    init(rxRequester: RxRequester, servicesRepository: ServicesRepository) {
        self.rxRequester = rxRequester
        self.servicesRepository = servicesRepository
    }

    public func subServices(onError: ((Error) -> Void)?) -> Single<[SubService]> {
        let options = RequestOptions.Builder()
                .doOnError(onError)
                .build()
        return rxRequester.request(options: options) {
            self.servicesRepository.subServices(serviceId: self.serviceId)
                    .map { ListMapper(SubServiceMapper()).map($0) }
        }
    }

}


