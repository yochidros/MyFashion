//
//  RootPresenter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

final class RootPresenter: RootPresentation, Injectable {
    var view: RootView?
    var wireframe: RootWireframe
    
    struct Dependency {
        let view: RootView?
        let wireframe: RootWireframe
    }
    
    init(dependency: RootPresenter.Dependency) {
        self.view = dependency.view
        self.wireframe = dependency.wireframe
    }
    
    func prepare() {
        let clothes = ClothesListResolver.resolve()
        self.wireframe.setViewControllers([clothes])
    }
    
}
