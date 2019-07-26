//
//  ClothesListPresenter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI
import Domain

final class ClothesListPresenter: ClothesListPresentation, Injectable {

    struct Dependency {
        let wirefame: ClothesListWireframe
        let useCase: ClothesListUseCase
    }
    var view: ClothesListView?
    var wireframe: ClothesListWireframe
    var useCase: ClothesListUseCase
    
    init(dependency: Dependency) {
        self.wireframe = dependency.wirefame
        self.useCase = dependency.useCase
    }

    func viewDidLoad() {
        self.prepareTabs()
    }
    
    func prepareTabs() {
        let handle: ((Tab) -> Void)? = { [weak self] (tab) in
            self?.view?.displayViewController(index: tab.index)
        }
        useCase.fetchTabItems(onSuccess: { [weak self] (tabs) in
            let types = tabs.map({ [handle] (tab) -> TabType in
                var t = tab
                t.selectedHandler = handle
                return TabType.Normal(t)
            })
            DispatchQueue.main.async { [weak self, types] in
                let views = types.map({ (type) -> ClothesViewController? in
                    if case .Normal(let tab) = type {
                     return ClothesViewController(tab: tab)
                    }
                    return nil
                })
                self?.view?.prepareTab(tabs: types)
                self?.view?.preparePageViewController(pages: views.compactMap { $0 })
            }
        }) { (error) in
            print(error)
        }
    }
}
