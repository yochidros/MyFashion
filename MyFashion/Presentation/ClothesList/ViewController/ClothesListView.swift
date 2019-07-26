//
//  ClothesListView.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit

protocol ClothesListView {
    var presenter: ClothesListPresentation { get set }
    func prepareTab(tabs: [TabType])
    func preparePageViewController(pages: [UIViewController])
    func displayViewController(index: Int)
}
