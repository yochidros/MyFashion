//
//  TabCollectionViewCell.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell, TabCollectionable {

    @IBOutlet weak var button: UIButton?
    
    var tab: Tab?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(tabItem: Tab) {
        self.tab = tabItem
        button?.setTitle(tabItem.name, for: .normal)
    }
    
    @IBAction func didTappedButton(_ sender: UIButton) {
        tab?.selectTab()
    }
}
