//
//  ClothesListTranslater.swift
//  UseCase
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import Data

public class ClothesListTabTranslater: Translater {
    public typealias Input = [TabEntity]
    public typealias Output = [Tab]
    
    public init() {
    }
    
    public func translate(_ input: [TabEntity]) -> [Tab] {
        return input.map({ Tab(index: $0.index, name: $0.name, selectedHandler: nil) })
    }
}
