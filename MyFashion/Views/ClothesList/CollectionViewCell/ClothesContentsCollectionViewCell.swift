//
//  ClothesContentsCollectionViewCell.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class ClothesContentsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var brandLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure() {
        self.imageView?.loadImage(url: "https://www.min-inuzukan.com/images/dog_img_shiba.jpg?18102302")
        self.brandLabel?.text = "brand"
        self.nameLabel?.text = "namemmmmmmmmmmmmmm"
    }
}
