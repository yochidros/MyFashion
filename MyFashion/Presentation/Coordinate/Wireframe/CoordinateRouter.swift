//
//  CoordinateRouter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

class CoordinateRouter: CoordinateWireframe {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let viewController = CoordinateViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return navigationController
    }
}
