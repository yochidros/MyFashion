//
//  Tab.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol TabCollectionable {
    func configure(name: String, handler: (() -> Void)?)
}

indirect enum TabType {
    case Normal(Tab)
    
    private var cellIdentifier: String {
        switch self {
        case .Normal:
            return TabCollectionViewCell.className
        }
    }
    
    func dequeueCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        if let c = cell as? TabCollectionable {
            switch self {
            case .Normal(let tab):
                c.configure(name: tab.name) { [tab] in
                   tab.selectTab()
                }
            }
        }
        return cell
    }
    
}
