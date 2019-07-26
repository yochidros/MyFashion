//
//  Translater.swift
//  UseCase
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

public protocol Translater {
    associatedtype Input
    associatedtype Output
    
    func translate(_ input: Input) -> Output
}
