//
//  RootView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

protocol RootView: BaseView {
    var presenter: RootPresentation? { get set }
}
