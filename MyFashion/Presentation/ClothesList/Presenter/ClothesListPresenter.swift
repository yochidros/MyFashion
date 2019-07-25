//
//  ClothesListPresenter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

final class ClothesListPresenter: NSObject, ClothesListPresentation, Injectable {

    struct Dependency {
        let view: ClothesListView
        let wireframe: ClothesListWireframe
    }
    var view: ClothesListView
    var wireframe: ClothesListWireframe
    
    init(dependency: Dependency) {
        self.view = dependency.view
        self.wireframe = dependency.wireframe
    }

    func viewDidLoad() {
        self.view.prepare()
    }
}
