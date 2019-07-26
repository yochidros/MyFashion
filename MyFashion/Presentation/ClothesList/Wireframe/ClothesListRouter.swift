//
//  ClothesListRouter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit
import Domain

final class ClothesListRouter: ClothesListWireframe {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let router = ClothesListRouter()
        let useCase = ClothesListUseCaseResolver.resolve()
        let presenter = ClothesListPresenter(dependency: .init(wirefame: router, useCase: useCase))
        let viewController = ClothesListViewController(dependency: presenter)
        presenter.view = viewController
        router.viewController = viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        return navigationController
    }
    
}
