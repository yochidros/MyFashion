//
//  ClothesContentsCollectionViewCell.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class ClothesContentsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentsView: UIView?

    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var brandLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure() {
        self.prepareView()
        self.imageView?.loadImage(url: "https://www.min-inuzukan.com/images/dog_img_shiba.jpg?18102302")
        self.brandLabel?.text = "brand"
        self.nameLabel?.text = "namemmmmmmmmmmmmmm"
    }
    
    private func prepareView() {
       self.contentsView?.layer.cornerRadius = 4
        self.contentsView?.clipsToBounds = true
        self.contentsView?.layer.borderWidth = 0.5
        self.contentsView?.layer.borderColor = UIColor.lightGray.cgColor
        self.contentsView?.layer.shadowRadius = 4
        self.contentsView?.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.contentsView?.layer.shadowOpacity = Float(0.9)
        self.contentsView?.layer.masksToBounds = false
    }
}
