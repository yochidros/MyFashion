//
//  DITestClass.swift
//  DITests
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
@testable import DI

class DITestClass: NSObject, Injectable {

    let name: String
    struct Dependency {
        let name: String
    }

    required init(dependency: Dependency) {
        self.name = dependency.name
    }
}
