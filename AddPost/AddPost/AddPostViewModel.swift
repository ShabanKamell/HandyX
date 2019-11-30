//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data
import RxRequester

final class AddPostViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    private let servicesRepository: ServicesRepository!

    init(rxRequester: RxRequester, servicesRepository: ServicesRepository) {
        self.rxRequester = rxRequester
        self.servicesRepository = servicesRepository
    }

    func addPost(request: AddPostRequest) -> Single<Success> {
         Single.just(Success())
    }

}


