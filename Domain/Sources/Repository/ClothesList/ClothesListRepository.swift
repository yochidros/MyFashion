//
//  ClothesListRepository.swift
//  Domain
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI
import Data

protocol ClothesListRepository {
    var dataStore: ClothesListDataStore { get }
    func fetchTabItems(onSuccess: @escaping ([TabEntity]) -> Void, onFailure: @escaping (Error) -> Void)
}

class ClothesListRepositoryImpl: ClothesListRepository, Injectable {
    typealias Dependency = ClothesListDataStore
    var dataStore: ClothesListDataStore
    
    required public init(dependency: ClothesListRepositoryImpl.Dependency) {
       self.dataStore = dependency
    }
    
    func fetchTabItems(onSuccess: @escaping (([TabEntity]) -> Void), onFailure: @escaping (Error) -> Void) {
        dataStore.getTabItems { [onSuccess, onFailure] (result) in
            switch result {
            case .success(let items):
                onSuccess(items)
            case .failure(let e):
                onFailure(e)
            }
        }
    }
}
