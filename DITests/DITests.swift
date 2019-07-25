//
//  DITests.swift
//  DITests
//
//  Created by Yoshiki Miyazawa on 2019/07/25.
//  Copyright © 2019 yochidros. All rights reserved.
//

import XCTest
@testable import DI

class DITests: XCTestCase {

    func testBasicInject() {
        let injectableObj = DITestClass(dependency: .init(name: "test"))
        XCTAssert("\(type(of: injectableObj))" == "DITestClass")
        XCTAssert(injectableObj.name == "test")
    }
    
    func testResolver() {
        let animal = AnimalResolver.resolve()
        XCTAssert("\(type(of: animal))" == "Dog")
        XCTAssert(animal.name == "Test Dog")
    }
    
    func testResolverExtension() {
        let cat = AnimalResolver.resolve(type: .cat)
        XCTAssert("\(type(of: cat))" == "Cat")
        XCTAssert(cat.name == "cat")
        XCTAssert(cat.sayHello() == "meow!")
    }
    
    func testResolverByExternalDepends() {
        let cat = AnimalResolver.resolve(by: (.cat, "make"))
        XCTAssert("\(type(of: cat))" == "Cat")
        XCTAssertFalse(cat.name == "cat")
        XCTAssertTrue(cat.name == "make")
        XCTAssert(cat.sayHello() == "meow!")
    }
}

