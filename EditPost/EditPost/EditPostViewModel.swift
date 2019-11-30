//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data
import RxRequester

final class EditPostViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    var post: Post!
    private let servicesRepository: ServicesRepository!

    init(rxRequester: RxRequester, servicesRepository: ServicesRepository) {
        self.rxRequester = rxRequester
        self.servicesRepository = servicesRepository
    }

    func editPost(request: EditPostRequest) -> Single<Success> {
        Single.just(Success())
    }

}


