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
    @IBOutlet weak var tabNameLabel: UILabel?
    
    private var handler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(name: String, current: Bool, handler: (() -> Void)?) {
        self.tabNameLabel?.text = name
        self.handler = handler
        setCurrent(isCurrent: current)
    }

    func setCurrent(isCurrent: Bool) {
        if isCurrent {
            self.tabNameLabel?.alpha = 1
            self.tabNameLabel?.font = .boldSystemFont(ofSize: 16)
            self.tabNameLabel?.textColor = .blue
        } else {
            self.tabNameLabel?.alpha = 0.7
            self.tabNameLabel?.font = .systemFont(ofSize: 14)
            self.tabNameLabel?.textColor = .black
        }
    }
    
    @IBAction func didTappedButton(_ sender: UIButton) {
        setCurrent(isCurrent: true)
        handler?()
    }
}
