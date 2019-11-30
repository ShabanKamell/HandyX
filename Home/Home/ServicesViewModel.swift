//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation
import RxRequester

struct ServicesViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    private let servicesRepository: ServicesRepository!

    init(rxRequester: RxRequester, servicesRepository: ServicesRepository) {
        self.rxRequester = rxRequester
        self.servicesRepository = servicesRepository
    }

    public func services(onError: ((Error) -> Void)?) -> Single<[Service]> {
        let options = RequestOptions.Builder()
                .doOnError(onError)
                .build()
       return rxRequester.request(options: options) {
            self.servicesRepository.services()
                    .map { ListMapper(ServiceMapper()).map($0) }
        }
    }


}


