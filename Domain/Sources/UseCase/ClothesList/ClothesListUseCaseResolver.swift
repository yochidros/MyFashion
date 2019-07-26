//
//  ClothesListUseCaseResolver.swift
//  Domain
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

public class ClothesListUseCaseResolver: Resolver {
    public typealias Resolve = ClothesListUseCase
    public typealias ExDependency = Never
    
    public static func resolve() -> ClothesListUseCase {
       let repository = ClothesListRepositoryResolver.resolve()
        let translater = ClothesListTabTranslater()
        return ClothesListUseCaseImpl(dependency: .init(repository: repository, translater: translater))
    }
    
    public static func resolve(by exDepends: Never?) -> ClothesListUseCase? {
        let repository = ClothesListRepositoryResolver.resolve()
        let translater = ClothesListTabTranslater()
        return ClothesListUseCaseImpl(dependency: .init(repository: repository, translater: translater))
    }

}
