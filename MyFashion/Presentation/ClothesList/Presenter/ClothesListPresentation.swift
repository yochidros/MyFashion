//
//  ClothesListPresentation.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import Domain

protocol ClothesListPresentation: BasePresentation {
    var view: ClothesListView? { get set }
    var wireframe: ClothesListWireframe { get }
    var useCase: ClothesListUseCase { get }
}
