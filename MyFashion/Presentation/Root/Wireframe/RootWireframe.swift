//
//  RootWireframe.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

protocol RootWireframe: class, BaseWireframe {
    var tabBarController: UITabBarController? { get set }
    
    static func assembleModule(_ rootViewController: RootViewController) -> RootPresentation
    
    func setViewControllers(_ viewControllers: [UIViewController])
}
