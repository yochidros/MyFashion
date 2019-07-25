//
//  Cat.swift
//  DITests
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

class Cat: Animal, Injectable {
    typealias Dependency = String
    
    var name: String
    
    required init(dependency: Cat.Dependency) {
        self.name = dependency
    }
    
    func sayHello() -> String {
        return "meow!"
    }
}
