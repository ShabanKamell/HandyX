//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation
import Dependencies
import RxSwift


final class QuestionsViewController: UIViewController, ViewControllerProtocol {
    var vm: QuestionsViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }

    func loadQuestions() {
        vm.questions()
                .subscribe(onSuccess: { [weak self] questions in
                    guard let self = self else { return }
//                    self.stackView.spacing   = 16.0
                    self.stackView.translatesAutoresizingMaskIntoConstraints = false
//                    (1...10).forEach { num in
//                        let label = UILabel()
//                        label.text = "LABEL LABEL LABEL LABEL LABEL LABEL LABEL "
//                        self.stackView.addArrangedSubview(label)
//                    }
                    questions.forEach { question in QuestionDrawer.draw(question: question, stackView: self.stackView) }
                })
                .disposed(by: disposeBag)
    }
}

extension QuestionsViewController: NavControllerContext {
    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
         false
    }

    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
         .withoutText
    }
}