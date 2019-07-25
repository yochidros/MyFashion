//
//  TabView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

struct Tab {
    let index: Int
    let name: String
    let selectedHandler: ((Tab) -> Void)?
}

protocol TabCollectionable {
    func configure(tabItem: Tab)
}

class TabView: UIView {

    var tabItems: [TabType] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        self.addSubview(collection)
        return collection
    }()
    
    private lazy var currentBarView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        self.collectionView.register(type: TabCollectionViewCell.self)
        self.collectionView.dataSource = self
    }

}

extension TabView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard tabItems.count > indexPath.row else {
            return UICollectionViewCell()
        }
        return tabItems[indexPath.row].dequeueCollectionViewCell(collectionView, indexPath: indexPath)
    }
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
                c.configure(tabItem: tab)
            }
        }
        return cell
    }
    
}
