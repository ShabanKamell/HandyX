//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation
import Dependencies
import RxSwift


final class SubServicesViewController: UIViewController, ViewControllerProtocol {
    var vm: SubServicesViewModel!
    var list: [SubService] = []
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: PagedTableView!{
        didSet {
            tableView.register(.subServiceCell, bundle: Bundle(for: type(of: self)))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.paginatedDelegate = self
        tableView.paginatedDataSource = self
        tableView.loadItems()
    }
}

extension SubServicesViewController: PaginatedTableViewDelegate {
    func loadMore(start: Int, pageCount: Int, onSuccess: ((Int) -> Void)?, onError: ((Error) -> Void)?) {
        vm.subServices(onError: onError)
                .subscribe(onSuccess: { [weak self] services in
                    self?.list += services
                    onSuccess?(services.count)
                })
                .disposed(by: disposeBag)
    }
}

// MARK: Paginated Data Source
extension SubServicesViewController: PaginatedTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { list.count }
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.configureCell(
                identifier: .subServiceCell,
                indexPath: indexPath,
                item: list[indexPath.row],
                delegate: self
        ) as SubServiceCell
        return cell
    }
}

extension SubServicesViewController: ConfigurableCellDelegate {
    public func cellTableView() -> UITableView {
        tableView
    }
    func viewController() -> UIViewController { self }
}


extension SubServicesViewController: NavControllerContext {
    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
         false
    }

    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
         .withoutText
    }
}


