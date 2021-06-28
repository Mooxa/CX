//
//  DBHelper.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 28/06/2021.
//

import Foundation

public protocol DBHelperProtocol {
    associatedtype ObjectType
    associatedtype PredicateType
    
    func create(_ object: ObjectType)
    func fetchFirst(_ objectType: ObjectType.Type, predicate: PredicateType?) -> Result<ObjectType?, Error>
    func fetch(_ objectType: ObjectType.Type, predicate: PredicateType?, limit: Int?) -> Result<[ObjectType], Error>
    func update(_ object: ObjectType)
}

//public extension DBHelperProtocol {
//    func fetch(_ objectType: ObjectType.Type, predicate: PredicateType? = nil, limit: Int? = nil) -> Result<[ObjectType], Error> {
//        print("xoxo 1 here")
//        return fetch(objectType, predicate: predicate, limit: limit)
//    }
//}
