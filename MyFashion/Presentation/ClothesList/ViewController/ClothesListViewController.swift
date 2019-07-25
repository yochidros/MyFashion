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
    @IBOutlet weak var tabView: TabView?
    
    var presenter: ClothesListPresentation
    
    fileprivate lazy var pageViewController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        return page
    }()
    
    struct Dependency {
        let presenter: ClothesListPresentation
    }
    
    required init(dependency: ClothesListViewController.Dependency) {
        self.presenter = dependency.presenter
        super.init(nibName: ClothesListViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func prepare() {
        let tabs = (0..<10).map({
            TabType.Normal(
                Tab(
                    index: $0,
                    name: "\($0)",
                    selectedHandler: { [weak self] (tab) in
                        print(tab)
                        self?.pageViewController.setViewControllers(nil, direction: .forward, animated: true, completion: nil)
                })
            )
        })
        tabView?.tabItems = tabs
    }

}

