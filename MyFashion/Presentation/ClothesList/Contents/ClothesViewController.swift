//
//  ClothesViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit
import Domain
class ClothesViewController: UIViewController {

    @IBOutlet weak var label: UILabel?
    
    let tab: Tab
    
    init(tab: Tab) {
        self.tab = tab
        super.init(nibName: ClothesViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepare()
    }
    
    func prepare() {
        self.label?.text = tab.name
    }

}
