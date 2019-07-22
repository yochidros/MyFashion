//
//  TabCollectionViewCell.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(text: String, isCurrent: Bool) {
        button?.setTitle(text, for: .normal)
        if (isCurrent) {
            button?.setTitleColor(.red, for: .normal)
        } else {
            button?.setTitleColor(.gray, for: .normal)
        }
    }

}
