//
//  ClothesListViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit
import DI

class ClothesListViewController: UIViewController, ClothesListView, Injectable {
    typealias Dependency = ClothesListPresentation
    
    @IBOutlet weak var tabView: TabView?
    var presenter: ClothesListPresentation
    
    fileprivate lazy var pageViewController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        return page
    }()

    required init(dependency: ClothesListViewController.Dependency) {
        self.presenter = dependency
        super.init(nibName: ClothesListViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func prepareTab(tabs: [TabType]) {
        self.tabView?.setItems(tabs: tabs)
    }
}

