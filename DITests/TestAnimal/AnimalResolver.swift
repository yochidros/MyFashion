//
//  AnimalResolver.swift
//  DITests
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

enum AnimalType {
    case dog
    case cat
}

class AnimalResolver: Resolver {
    typealias Resolve = Animal
    typealias ExDependency = (type: AnimalType, name: String)
    
    static func resolve() -> Animal {
        let depends = "Test Dog"
        return Dog(dependency: depends)
    }
    
    static func resolve(type: AnimalType) -> Animal {
        switch type {
        case .dog:
            return Dog(dependency: "dog")
        case .cat:
            return Cat(dependency: "cat")
        }
    }
    
    static func resolve(by exDepends: (type: AnimalType, name: String)) -> Animal {
        switch exDepends.type {
        case .dog:
            return Dog(dependency: exDepends.name)
        case .cat:
            return Cat(dependency: exDepends.name)
        }
    }
}
