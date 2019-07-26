//
//  ClothesListRepositoryResolver.swift
//  Domain
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI
import Data

public class ClothesListRepositoryResolver: Resolver {
    public typealias Resolve = ClothesListRepository
    public typealias ExDependency = Never
    
    
    public static func resolve() -> ClothesListRepository {
        let dataStore = ClothesListDataStoreResolver.resolve()
        return ClothesListRepositoryImpl(dependency: dataStore)
    }
    
    public static func resolve(by exDepends: Never?) -> ClothesListRepository? {
        let dataStore = ClothesListDataStoreResolver.resolve()
        return ClothesListRepositoryImpl(dependency: dataStore)
    }
}
