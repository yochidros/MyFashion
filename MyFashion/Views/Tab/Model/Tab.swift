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
    func configure(name: String, current: Bool, handler: (() -> Void)?)
    func setCurrent(isCurrent: Bool)
}

indirect enum TabType {
    case Normal(Tab)
    
    private var cellIdentifier: String {
        switch self {
        case .Normal:
            return TabCollectionViewCell.className
        }
    }
    
    private var textAttributes: [NSAttributedString.Key: Any]? {
        switch self {
        case .Normal:
            return [
                .font: UIFont(name: "HiraKakuProN-W3", size: 14) ?? UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.gray
            ]
        }
    }
    
    func collectionViewCellSize(height: CGFloat, margin: CGFloat = 0.0) -> CGSize {
        switch self {
        case .Normal(let tab):
            let size = (tab.name as NSString).size(withAttributes: textAttributes)
            return CGSize(width: size.width.rounded(.up) + margin, height: height)
        }
    }
    
    func dequeueCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath, current: Bool = false) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        if let c = cell as? TabCollectionable {
            switch self {
            case .Normal(let tab):
                c.configure(name: tab.name, current: current) { [tab] in
                   tab.selectTab()
                }
            }
        }
        return cell
    }
    
}
