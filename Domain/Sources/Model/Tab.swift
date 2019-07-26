//
//  Tab.swift
//  Domain
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

public struct Tab {
    let index: Int
    let name: String
    let selectedHandler: ((Tab) -> Void)?
    
    func selectTab() {
        selectedHandler?(self)
    }
}
