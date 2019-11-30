//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation
import RxRequester

class QuestionsViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    private let servicesRepository: ServicesRepository!
    var subServiceId: Int!

    init(rxRequester: RxRequester, servicesRepository: ServicesRepository) {
        self.rxRequester = rxRequester
        self.servicesRepository = servicesRepository
    }

    public func questions(onError: ((Error) -> Void)?) -> Single<[Question]> {
        let options = RequestOptions.Builder()
                .doOnError(onError)
                .build()
        return rxRequester.request(options: options) {
            self.servicesRepository.questions(subServiceId: self.subServiceId)
                    .map { ListMapper(QuestionMapper()).map($0) }
        }
    }

}


