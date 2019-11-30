//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit
import Presentation
import Data
import Dependencies
import RxRequester


class ServiceCell: ConfigurableCell<Service> {

    @IBOutlet weak var ivServiceImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    override func setup() {
        super.setup()
        contentView.tap(target: self, action: #selector(didTapCell))

        ivServiceImage.setImage(url: item.image)
        lblName.text = item.name
        lblPrice.text = item.price
        lblDescription.text = item.serviceDescription
    }

    @objc
    func didTapCell() {
        Dependencies.shared.subServicesModule.subServicesScreen(serviceId: item.id).push()
    }

}

