//
//  DataTests.swift
//  DataTests
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import XCTest
@testable import Data

class DataTests: XCTestCase {
    
    let dataStore: ClothesListDataStore = ClothesListDataStoreImpl()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTabEntity() {
        let tab = TabEntity(name: "tab", index: 0)
        
        XCTAssert("\(type(of: tab))" == "TabEntity")
        XCTAssert(tab.index == 0)
        XCTAssert(tab.name == "tab")
        XCTAssertNotEqual(tab.name, "tabbb")
    }
    
    func testClothesListDataStore() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "ClothesListDataStoreExpectation")
        dataStore.getTabItems { [expectation] (result) in
            switch result {
            case .success(let tabs):
                dump(tabs)
                XCTAssert(tabs.count != 0)
                expectation.fulfill()
            case .failure(let e):
                XCTAssert("\(type(of: e))" == "DataStoreError")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func testClothesListDataStoreMulti() {
        
        let max = 100
        let expectations = (0..<max).map({ XCTestExpectation(description: "ClothesListDataStoreExpectation\($0)")})
        (0..<max).forEach { [expectations] (index) in
            let expectation = expectations[index]
            dataStore.getTabItems { [expectation] (result) in
                switch result {
                case .success(let tabs):
                    dump(tabs)
                    XCTAssert(tabs.count != 0)
                    expectation.fulfill()
                case .failure(let e):
                    dump(e)
                    XCTAssert("\(type(of: e))" == "DataStoreError")
                    XCTAssert((e as DataStoreError).self == DataStoreError.unknown)
                    expectation.fulfill()
                }
            }
        }
        wait(for: expectations, timeout: 10)
    }
}
