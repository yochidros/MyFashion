//
//  RootViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

final class RootViewController: UITabBarController, RootView {
    var presenter: RootPresentation?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let presentation = RootResolver.resolve(by: self) {
            self.presenter = presentation
        }
        self.presenter?.prepare()
    }
    
}
