//
//  ClothesListPresenter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

final class ClothesListPresenter: ClothesListPresentation, Injectable {

    typealias Dependency = ClothesListWireframe
    var view: ClothesListView?
    var wireframe: ClothesListWireframe
    
    init(dependency: Dependency) {
        self.wireframe = dependency
    }

    func viewDidLoad() {
        self.prepareTabs()
    }
    
    func prepareTabs() {
        let tabs = (0..<10).map({
            TabType.Normal(
                Tab(
                    index: $0,
                    name: "\($0)",
                    selectedHandler: { (tab) in
                        print(tab)
                })
            )
        })
        self.view?.prepareTab(tabs: tabs)
    }
}
