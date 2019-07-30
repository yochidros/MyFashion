//
//  UIImageView+Extension.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    func loadImage(url: String, placeholder: URL? = nil) {
        guard let u = URL(string: url) else { return }
        Nuke.loadImage(with: u, into: self)
    }
}
