//
//  ClothesListWireframe.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

protocol ClothesListWireframe: BaseWireframe {
    func assembleModule(_ viewController: ClothesListViewController) -> ClothesListPresentation
}

final class ClothesListRouter: ClothesListWireframe {
    var viewController: UIViewController?
    
    func assembleModule(_ viewController: ClothesListViewController) -> ClothesListPresentation {
        let presenter = ClothesListPresenter(dependency: .init(view: viewController, wireframe: self))
        self.viewController = viewController
        return presenter
    }

}

