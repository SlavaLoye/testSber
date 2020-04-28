//
//  RealmService.swift
//  TestSber
//
//  Created by Viacheslav Loie on 27.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import RealmSwift
import Realm

protocol RealmService {
	func save(_ object: Object)
	func save(_ objects: [Object])
	func retrieveObjects<T: Object>(of type: T.Type) -> [T]
	func write(_ closure: @escaping VoidClosure)
	func delete(_ object: Object)
	func delete(_ objects: [Object])
}

