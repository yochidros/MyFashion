//
//  UICollectionView+Extension.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit


extension UICollectionView {
    func register<T: UICollectionViewCell>(type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: className)
    }
}
