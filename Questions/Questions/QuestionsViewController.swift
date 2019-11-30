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
    var list: [Question] = []
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: PagedTableView!{
        didSet {
            tableView.register(.questionCell, bundle: Bundle(for: type(of: self)))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.paginatedDelegate = self
        tableView.paginatedDataSource = self
        tableView.loadItems()
    }
}

extension QuestionsViewController: PaginatedTableViewDelegate {
    func loadMore(start: Int, pageCount: Int, onSuccess: ((Int) -> Void)?, onError: ((Error) -> Void)?) {
        vm.questions(onError: onError)
                .subscribe(onSuccess: { [weak self] questions in
                    self?.list += questions
                    onSuccess?(questions.count)
                })
                .disposed(by: disposeBag)
    }
}

// MARK: Paginated Data Source
extension QuestionsViewController: PaginatedTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { list.count }
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.configureCell(
                identifier: .questionCell,
                indexPath: indexPath,
                item: list[indexPath.row],
                delegate: self
        ) as QuestionCell
        return cell
    }
}

extension QuestionsViewController: ConfigurableCellDelegate {
    public func cellTableView() -> UITableView {
        tableView
    }
    func viewController() -> UIViewController { self }
}


extension QuestionsViewController: NavControllerContext {
    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
         false
    }

    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
         .withoutText
    }
}


