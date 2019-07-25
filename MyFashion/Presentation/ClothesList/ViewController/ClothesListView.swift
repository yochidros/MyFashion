//
//  ClothesListView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation

protocol ClothesListView {
    var presenter: ClothesListPresentation { get set }
    func prepare()
}