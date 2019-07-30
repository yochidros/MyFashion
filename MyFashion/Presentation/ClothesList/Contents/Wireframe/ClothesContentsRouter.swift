//
//  ClothesContentsRouter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import Domain
import UIKit

class ClothesContentsRouter: ClothesContentsWireframe {
    var viewController: UIViewController?
    static func assembleModule(tab: Tab) -> UIViewController {
        let router = ClothesContentsRouter()
        let presenter = ClothesContentsPresenter(dependency: .init(wireframe: router, tab: tab))
        let viewController = ClothesContentsViewController(dependency: presenter)
        presenter.view = viewController
        router.viewController = viewController
        return viewController
    }
    
}
