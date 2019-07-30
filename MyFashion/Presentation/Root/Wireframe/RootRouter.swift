//
//  RootRouter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RootRouter: RootWireframe {
    var viewController: UIViewController?
    var tabBarController: UITabBarController?
    
    static func assembleModule(_ rootViewController: RootViewController) -> RootPresentation {
        let wireframe = RootRouter()
        let presenter = RootPresenter(
            dependency: .init(
                view: rootViewController,
                wireframe: wireframe
            )
        )
        wireframe.viewController = rootViewController
        wireframe.tabBarController = rootViewController
        return presenter
    }

    func setViewControllers(_ viewControllers: [UIViewController]) {
        self.tabBarController?.setViewControllers(viewControllers, animated: false)
        guard let tabbar = self.tabBarController?.tabBar else { return }
        
        let view = CameraTabView()
        view.backgroundColor = .red
        tabbar.insertSubview(view, at: 1)
        let width = tabbar.frame.width / CGFloat(tabbar.subviews.count)
        let height = tabbar.frame.height
        var left = tabbar.snp.left
        
        for v in tabbar.subviews {
            v.snp.makeConstraints { (make) in
                make.height.equalTo(height)
                make.width.equalTo(width)
                make.top.equalTo(tabbar)
                make.left.equalTo(left)
            }
            left = v.snp.right
        }
        
    }
}

import DI
class RootResolver: Resolver {
    typealias Resolve = RootPresentation
    typealias ExDependency = RootViewController
    
    static func resolve() -> RootPresentation {
        return RootPresenter(dependency: .init(view: nil, wireframe: RootRouter()))
    }

    static func resolve(by exDepends: RootViewController?) -> RootPresentation? {
        guard let root = exDepends else { return nil }
        return RootRouter.assembleModule(root)
    }
}
