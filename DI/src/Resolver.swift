//
//  Resolver.swift
//  DI
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

public protocol Resolver {
    associatedtype Resolve
    associatedtype ExDependency
    static func resolve(by exDepends: ExDependency) -> Resolve
    static func resolve() -> Resolve
}
