//
//  ClothesListDataStore.swift
//  Data
//
//  Created by Yoshiki Miyazawa on 2019/07/26.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

public protocol ClothesListDataStore {
    func getTabItems(onResult: @escaping (Result<[TabEntity], DataStoreError>) -> Void)
}

public class ClothesListDataStoreImpl: ClothesListDataStore {
    public func getTabItems(onResult: @escaping (Result<[TabEntity], DataStoreError>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(Int.random(in: 0...2))) { [onResult] in
            let items = (0..<Int.random(in: 0..<20)).map({ TabEntity.init(name: "Tab \($0)", index: $0)})
            guard items.count != 0 else {
                onResult(.failure(.unknown))
                return
            }
            onResult(.success(items))
        }
    }
    public init() {
    }
}

public enum DataStoreError: Error {
    case unknown
    case cast
}
