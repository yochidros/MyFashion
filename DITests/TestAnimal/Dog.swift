//
//  Dog.swift
//  DITests
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

public class Dog: Animal, Injectable{
    public typealias Dependency = String

    var name: String
    
    public required init(dependency: Dependency) {
       self.name = dependency
    }

    func sayHello() -> String {
        return "hooo!"
    }
}
