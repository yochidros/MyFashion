//
//  ClothesListViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class ClothesListViewController: UIViewController {

    @IBOutlet weak var tabView: TabView?
    fileprivate lazy var pageViewController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        return page
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePageView()
    }
    
    private func preparePageView() {
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

