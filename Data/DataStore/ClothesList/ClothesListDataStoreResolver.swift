//
//  ClothesListDataStoreResolver.swift
//  Data
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

public class ClothesListDataStoreResolver: Resolver {
    public static func resolve() -> ClothesListDataStore {
        return ClothesListDataStoreImpl()
    }
    
    public static func resolve(by exDepends: Never?) -> ClothesListDataStore? {
        return ClothesListDataStoreImpl()
    }
    
    public typealias Resolve = ClothesListDataStore
    
    public typealias ExDependency = Never
}
