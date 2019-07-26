//
//  ClothesListUseCase.swift
//  UseCase
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

public protocol ClothesListUseCase: class {
    func fetchTabItems(onSuccess: @escaping ([Tab]) -> Void, onFailure: @escaping (Error) -> Void)
    func fetchListContents()
}

class ClothesListUseCaseImpl: ClothesListUseCase, Injectable {
    let repository: ClothesListRepository
    let translater: ClothesListTabTranslater
    
    struct Dependency {
        let repository: ClothesListRepository
        let translater: ClothesListTabTranslater
    }
    
    required init(dependency: ClothesListUseCaseImpl.Dependency) {
        self.repository = dependency.repository
        self.translater = dependency.translater
    }
    
    func fetchTabItems(onSuccess: @escaping ([Tab]) -> Void, onFailure: @escaping (Error) -> Void) {
        self.repository.fetchTabItems(onSuccess: { [translater, onSuccess] (entity) in
           let items = translater.translate(entity)
            onSuccess(items)
        }) { [onFailure] (error) in
           onFailure(error)
        }
    }
    
    func fetchListContents() {
    }
}
