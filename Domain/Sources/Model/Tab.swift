//
//  Tab.swift
//  Domain
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

public struct Tab {
    public let index: Int
    public let name: String
    public var selectedHandler: ((Tab) -> Void)?
    
    public func selectTab() {
        selectedHandler?(self)
    }
}
