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
    fileprivate var currentIndex: Int = 0 

    fileprivate lazy var pageViewController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.view.addSubview(page.view)
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
        navigationController?.setNavigationBarHidden(true, animated: false)
        presenter.viewDidLoad()
        preparePageViewControlller()
    }
    

    private func preparePageViewControlller() {
        pageViewController.view.snp.makeConstraints { [weak self] (make) in
            if let tab = self?.tabView {
                make.top.equalTo(tab.snp.bottom)
            }
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func prepareTab(tabs: [TabType]) {
        self.tabView?.setItems(tabs: tabs)
    }
    
    func preparePageViewController(pages: [UIViewController]) {
        guard pages.count > 0 else { return }
        self.contentsViewControllers = pages
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentIndex = 0
        tabView?.setIndex(index: currentIndex)
    }
    
    func displayViewController(index: Int) {
        pageViewController.setViewControllers(
            [contentsViewControllers[index]],
            direction: currentIndex > index ? .reverse : .forward,
            animated: true,
            completion: nil
        )
        currentIndex = index
        tabView?.setIndex(index: currentIndex)
    }
}

extension ClothesListViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let current = pageViewController.viewControllers?.first {
            let index = contentsViewControllers.firstIndex(of: current) ?? 0
            self.currentIndex = index
        }
        tabView?.setIndex(index: currentIndex)
    }
}
extension ClothesListViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contentsViewControllers.firstIndex(of: viewController),
            index+1 < contentsViewControllers.count else {
            return nil
        }
        return contentsViewControllers[index+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = contentsViewControllers.firstIndex(of: viewController),
            index-1 >= 0 else {
            return nil
        }
        return contentsViewControllers[index-1]
    }
}

