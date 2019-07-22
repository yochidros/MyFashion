//
//  NSObject+Extension.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/22.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
