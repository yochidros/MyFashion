//
//  DomainTests.swift
//  DomainTests
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import XCTest
import Data
@testable import Domain

class DomainTests: XCTestCase {

    let dataStore: ClothesListDataStore = ClothesListDataStoreImpl()
    let translater: ClothesListTabTranslater = ClothesListTabTranslater()

    override func setUp() {
    }

    override func tearDown() {
    }

    private let exception: XCTestExpectation = XCTestExpectation(description: "ClothesUseCaseTest")
    
    func testClothesUseCase() {
        let repository: ClothesListRepository = ClothesListRepositoryImpl(dependency: dataStore)
        let useCase = ClothesListUseCaseImpl(dependency: .init(repository: repository, translater: translater))
        useCase.fetchTabItems(onSuccess: { [exception] (tabs) in
            dump(tabs)
            XCTAssert(tabs.count != 0)
            exception.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
        }
        
        wait(for: [exception], timeout: 10)
    }
    
    func testClothesListRepository() {
        let repository: ClothesListRepository = ClothesListRepositoryImpl(dependency: dataStore)
        repository.fetchTabItems(onSuccess: { [exception] (tabs) in
           XCTAssert(tabs.count != 0)
            dump(tabs)
            exception.fulfill()
        }) { [exception] (error) in
            exception.fulfill()
        }
        wait(for: [exception], timeout: 3)
    }

}
