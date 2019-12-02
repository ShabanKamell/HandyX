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

    public func questions() -> Single<[Question]> {
        rxRequester.request() {
            self.servicesRepository.questions(subServiceId: self.subServiceId)
                    .map { ListMapper(QuestionMapper()).map($0) }
        }
    }

}


