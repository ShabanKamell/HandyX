//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation
import Dependencies
import RxSwift

final class ServicesViewController: UIViewController, ViewControllerProtocol {
    var vm: ServicesViewModel!
    var list: [Service] = []
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: PagedTableView!{
            didSet {
                tableView.register(.serviceCell, bundle: Bundle(for: type(of: self)))
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.paginatedDelegate = self
        tableView.paginatedDataSource = self
        tableView.loadItems()
    }
}

extension ServicesViewController: PaginatedTableViewDelegate {
    func loadMore(start: Int, pageCount: Int, onSuccess: ((Int) -> Void)?, onError: ((Error) -> Void)?) {
        vm.services(onError: onError)
                .subscribe(onSuccess: { [weak self] services in
                    self?.list += services
                    onSuccess?(services.count)
                })
                .disposed(by: disposeBag)
    }
}

// MARK: Paginated Data Source
extension ServicesViewController: PaginatedTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { list.count }
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.configureCell(
                identifier: .serviceCell,
                indexPath: indexPath,
                item: list[indexPath.row],
                delegate: self
        ) as ServiceCell
        return cell
    }
}

extension ServicesViewController: ConfigurableCellDelegate {
    public func cellTableView() -> UITableView {
        tableView
    }
    func viewController() -> UIViewController { self }
}


