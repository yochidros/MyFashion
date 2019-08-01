//
//  ClothesContentsPresenter.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import DI
import Domain

final class ClothesContentsPresenter: NSObject, ClothesContentsPresentation, Injectable {
    
    private let contentsCountPerRow: Int = 3
    var view: ClothesContentsView?
    var wireframe: ClothesContentsWireframe
    
    var dataSource: UICollectionViewDataSource?
    var delegate: UICollectionViewDelegateFlowLayout?
    
    let tab: Tab
    
    private var items: [Int] = []
    
    struct Dependency {
        let wireframe: ClothesContentsWireframe
        let tab: Tab
    }
    
    init(dependency: ClothesContentsPresenter.Dependency) {
        self.wireframe = dependency.wireframe
        self.tab = dependency.tab
    }
    
    func viewDidLoad() {
        prepare()
    }
    
    private func prepare() {
        self.items = (1...Int.random(in: 1...20)).map({ $0 })
        dataSource = self
        delegate = self
    }
}

extension ClothesContentsPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width / CGFloat(contentsCountPerRow)) - 8*2
        return CGSize(width: width, height: width*1.2)
    }
}
extension ClothesContentsPresenter: UICollectionViewDataSource {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothesContentsCollectionViewCell.className, for: indexPath)
        if let c = cell as? ClothesContentsCollectionViewCell {
            c.configure()
        }
        return cell
    }
}
