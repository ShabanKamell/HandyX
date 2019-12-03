//
// Created by mac on 2019-03-07.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit
import Core

public protocol NibDefinable where Self: UIView {
    var nibName: String { get }
}

@IBDesignable
open class NibView: UIView, NibDefinable {

    public weak var view: UIView!

    public var nibName: String {
        let name = self.className
        return name
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear

        view = loadViewFromNib()
        view.frame = bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)
    }

    private func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
        let views = nib.instantiate(withOwner: self, options: nil)
        let nibView = views.first as? UIView

        guard nibView != nil else { fatalError() }

        return nibView!
    }

}