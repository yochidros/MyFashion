//
//  Animal.swift
//  DITests
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI

protocol Animal {
    var name: String { get }
    func sayHello() -> String
}

