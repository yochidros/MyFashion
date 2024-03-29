//
//  Injectable.swift
//  DI
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

public protocol Injectable {
    associatedtype Dependency
    init(dependency: Dependency)
}
