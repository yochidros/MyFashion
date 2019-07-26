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
    
    private var handler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(name: String, handler: (() -> Void)?) {
        button?.setTitle(name, for: .normal)
        self.handler = handler
    }

    @IBAction func didTappedButton(_ sender: UIButton) {
        handler?()
    }
}
