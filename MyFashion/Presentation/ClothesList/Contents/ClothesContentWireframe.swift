//
//  ClothesContentWireframe.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol ClothesContentsWireframe: BaseWireframe {
    static func assembleModule(tab: Tab) -> UIViewController
}

