//
//  TabView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit


class TabView: UIView {
    private var tabItems: [TabType] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        dump(layout)
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
    
    func setItems(tabs: [TabType]) {
        self.tabItems = tabs
        self.collectionView.reloadData()
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

