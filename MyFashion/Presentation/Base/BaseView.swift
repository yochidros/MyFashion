//
//  BaseView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

protocol BaseView: class {
}

protocol BasePresentation: class {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisAppear()
    func viewDidDisAppear()
}
extension BasePresentation {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisAppear() {}
    func viewDidDisAppear() {}
}


protocol BaseWireframe {
    var viewController: UIViewController? { get set }
}
