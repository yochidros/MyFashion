//
//  CameraTabView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

class CameraTabView: UIView {
    @IBOutlet weak var iconImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    private func loadNib() {
        let view = Bundle.main.loadNibNamed(CameraTabView.className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        self.addSubview(view)
        self.backgroundColor = .clear
        
        iconImageView?.loadImage(url: "https://developer.apple.com/design/human-interface-guidelines/ios/images/icons/navigation_bar_toobar_icons/Navigation_Camera.png")
    }
    
    
}
