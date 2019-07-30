//
//  ClothesViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit
import DI

class ClothesContentsViewController: UIViewController, Injectable, ClothesContentsView {
    typealias Dependency = ClothesContentsPresentation
    @IBOutlet weak var collectionView: UICollectionView?

    var presenter: ClothesContentsPresentation
    required init(dependency: ClothesContentsViewController.Dependency) {
        self.presenter = dependency
        super.init(nibName: ClothesContentsViewController.className, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 8
            layout.minimumLineSpacing = 8
            self.collectionView?.collectionViewLayout = layout
        }
        self.collectionView?.contentInset = UIEdgeInsets(top: 12, left: 8, bottom: 36, right: 8)
        self.collectionView?.register(type: ClothesContentsCollectionViewCell.self)
        self.collectionView?.dataSource = presenter.dataSource
        self.collectionView?.delegate = presenter.delegate
    }
    
}

