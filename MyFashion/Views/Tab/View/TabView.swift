//
//  TabView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit
import SnapKit

class TabView: UIView {
    static let tabViewFixedHeight: CGFloat = 52
    private let tabHorizontalMargin: CGFloat = 8
    private var tabItems: [TabType] = []
    private var currentIndex: Int = 0
    
    @IBOutlet weak var bottomBarView: UIView?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.scrollsToTop = false
        self.addSubview(collection)
        return collection
    }()
    
    private lazy var currentBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        addSubview(view)
        bringSubviewToFront(view)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        prepareCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        prepareCollectionView()
    }
    
    private func loadNib() {
        let view = Bundle.main.loadNibNamed(TabView.className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func setItems(tabs: [TabType]) {
        self.tabItems = tabs
        self.collectionView.reloadData()
        setIndex(index: currentIndex)
    }
    
    func setIndex(index: Int) {
        currentIndex = index
        guard !tabItems.isEmpty else {
            currentBarView.isHidden = true
            return
        }
        
        currentBarView.isHidden = false
        collectionView.visibleCells.compactMap { $0 as? TabCollectionable }.forEach { (tab) in
            tab.setCurrent(isCurrent: false)
        }
        
        let indexPath = IndexPath(row: index, section: 0)
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            let size = tabItems[indexPath.row].collectionViewCellSize(
                height: TabView.tabViewFixedHeight,
                margin: tabHorizontalMargin
            )
            currentBarView.frame = CGRect(x: 8, y: size.height - 1, width: size.width, height: 1)
            return
        }
        updateContentOffSets(animated: true, toFrame: cell.frame)
        UIView.animate(withDuration: TimeInterval(0.3)) { [currentBarView, index] in
            currentBarView.frame = self.currentBarFrame(at: index) ?? .zero
        }
        if let c = cell as? TabCollectionable {
            c.setCurrent(isCurrent: true)
        }
    }

    private func currentBarFrame(at index: Int) -> CGRect? {
        let indexPath = IndexPath(row: index, section: 0)
        guard let attributes = collectionView.layoutAttributesForItem(at: indexPath) else {
            return nil
        }
        var frame = attributes.frame
        let targetContentOffsetX = collectionView.contentSize.width > self.frame.width ? contentOffsetCell(withFrame: frame) : 0
        frame.origin.x = frame.origin.x - targetContentOffsetX
        frame.origin.y = self.frame.height - 1
        frame.size.height = 1
        return frame
    }
    
    private func updateContentOffSets(animated: Bool, toFrame: CGRect) {
        let targetContentOffsetX = collectionView.contentSize.width > self.frame.width ? contentOffsetCell(withFrame: toFrame) : 0
        let offset = CGPoint(x: targetContentOffsetX, y: 0)
        collectionView.setContentOffset(offset, animated: animated)
    }
    
    private func contentOffsetCell(withFrame cellFrame: CGRect) -> CGFloat {
        let positionX: CGFloat = (frame.size.width - cellFrame.size.width) * 0.5
        var contentOffsetX: CGFloat = cellFrame.origin.x - positionX
        contentOffsetX = max(0, contentOffsetX)
        contentOffsetX = min(collectionView.contentSize.width - frame.size.width, contentOffsetX)
        return contentOffsetX
    }
    
    private func prepareCollectionView() {
        self.collectionView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(TabView.tabViewFixedHeight)
        }
        self.collectionView.register(type: TabCollectionViewCell.self)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

}

extension TabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard self.tabItems.count > indexPath.row else { return .zero }
        let size = tabItems[indexPath.row].collectionViewCellSize(
            height: TabView.tabViewFixedHeight,
            margin: tabHorizontalMargin
        )
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let c = cell as? TabCollectionable else {
             return
        }
        c.setCurrent(isCurrent: indexPath.row == currentIndex)
    }
}
extension TabView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cell = collectionView.cellForItem(at: IndexPath(row: currentIndex, section: 0)) else {
            currentBarView.isHidden = true
            return
        }
        currentBarView.isHidden = false
        let frame = currentBarView.frame
        currentBarView.frame = CGRect(x: cell.frame.minX - scrollView.contentOffset.x, y: frame.minY, width: frame.width, height: frame.height)
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
        return tabItems[indexPath.row].dequeueCollectionViewCell(collectionView, indexPath: indexPath, current: currentIndex == indexPath.row)
    }
}

