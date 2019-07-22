//
//  ClothesListViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class ClothesListViewController: UIViewController {

    fileprivate lazy var pageViewController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return page
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePageView()
    }
    
    private func preparePageView() {
    }

}
