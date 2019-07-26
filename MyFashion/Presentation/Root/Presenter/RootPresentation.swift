//
//  RootPresentation.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

protocol RootPresentation: class, BasePresentation {
    var view: RootView? { get set }
    var wireframe: RootWireframe { get }
    
    func prepare()
}
