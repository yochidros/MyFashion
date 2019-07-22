//
//  TabView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class TabView: UIView {

    var tabItems: [String] = ["hello", "world"]
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .red
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
extension TabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 68)
    }
}

extension TabView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.className, for: indexPath)
        if let c = cell as? TabCollectionViewCell {
            let tab = tabItems[indexPath.row]
            c.configure(text: tab, isCurrent: false)
        }
        return cell
    }
}
