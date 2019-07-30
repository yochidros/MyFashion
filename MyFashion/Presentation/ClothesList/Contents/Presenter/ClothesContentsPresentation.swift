//
//  ClothesContentsPresentation.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

protocol ClothesContentsPresentation: BasePresentation {
    var view: ClothesContentsView? { get }
    var wireframe: ClothesContentsWireframe { get }
    var dataSource: UICollectionViewDataSource? { get }
    var delegate: UICollectionViewDelegateFlowLayout? { get }
}

