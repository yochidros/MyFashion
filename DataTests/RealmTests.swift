//
//  RealmTests.swift
//  DataTests
//
//  Created by Yoshiki Miyazawa on 2019/07/30.
//  Copyright © 2019 yochidros. All rights reserved.
//

import XCTest
@testable import Data
import RealmSwift

class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
class RealmTests: XCTestCase {

    private var realm: Realm?
    

    override func setUp() {
        super.setUp()
        print("Setup")
        do {
            self.realm = try Realm(configuration: .init(inMemoryIdentifier: self.name))
        } catch let e {
            XCTFail(e.localizedDescription)
        }

    }

    override func tearDown() {
        super.tearDown()
        print("Tear Down")
        do {
            self.realm?.beginWrite()
            self.realm?.deleteAll()
            try self.realm?.commitWrite()
        } catch let e as NSError {
           print(e.debugDescription)
        }
    }

    func testExample() {
        print("Test")
        XCTAssertNotNil(realm)
        
        do {
            let dogs = (0..<Int.random(in: 10...100)).map { (i) -> Dog in
                let dog = Dog()
                dog.age = i
                dog.name = "Dog No.\(i)"
                return dog
            }
            
            print(dogs.count)
            try self.realm?.write {
                [dogs, realm] in
                realm?.add(dogs)
            }

            let dogss = self.realm?.objects(Dog.self).filter("age < 30")
            dump(dogss)
            XCTAssert(dogss?.count != 0)

        } catch let e {
           XCTFail(e.localizedDescription)
        }
    }
}
