//
//  ClothesListResolver.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit
import DI

final class ClothesListResolver: Resolver {

    typealias Resolve = UIViewController
    typealias ExDependency = Never
    
    static func resolve() -> UIViewController {
        return ClothesListRouter.assembleModule()
    }
    
    static func resolve(by exDepends: Never?) -> UIViewController? {
        return ClothesListRouter.assembleModule()
    }
}
