//
//  RootViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

final class RootViewController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = ClothesListViewController.init(nibName: ClothesListViewController.className, bundle: nil)
        let nav = UINavigationController(rootViewController: view)
        nav.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        self.setViewControllers([nav], animated: false)
    }
    
}
