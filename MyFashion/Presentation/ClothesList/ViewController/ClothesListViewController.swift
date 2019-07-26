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
    
    fileprivate var contentsViewControllers: [UIViewController] = []
    
    fileprivate lazy var pageViewController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let frame: CGRect = CGRect(x: 0, y: self.tabView?.frame.height ?? 0, width: self.view.bounds.width, height: self.view.bounds.height - (self.tabView?.bounds.height ?? 0))
        page.view.frame = frame
        self.view.addSubview(page.view)
        if let tab = self.tabView {
            self.view.bringSubviewToFront(tab)
        }
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
    
    func preparePageViewController(pages: [UIViewController]) {
        self.contentsViewControllers = pages
        pageViewController.dataSource = self
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
    }
    
    func displayViewController(index: Int) {
        pageViewController.setViewControllers([contentsViewControllers[index]], direction: .forward, animated: true, completion: nil)
    }
}

extension ClothesListViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contentsViewControllers.firstIndex(of: viewController), index+1 < contentsViewControllers.count else {
            return nil
        }
        return contentsViewControllers[index+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = contentsViewControllers.firstIndex(of: viewController), index-1 > 0 else {
            return nil
        }
        return contentsViewControllers[index-1]
    }
}

