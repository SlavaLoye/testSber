//
//  RealmServiceImplementation.swift
//  TestSber
//
//  Created by Viacheslav Loie on 27.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import RealmSwift
import Realm

class RealmServiceImplementation: RealmService {
	
  // сохранение Object
  func save(_ object: Object) {
		let realm = try! Realm()
		write {
			realm.add(object, update: .all)
		}
	}
  // удаление [Object]
  func delete(_ objects: [Object]) {
    let realm = try! Realm()
    write {
      realm.delete(objects)
    }
  }
  // удаление Object
  func delete(_ object: Object) {
    let realm = try! Realm()
    write {
      realm.delete(object)
    }
  }
	// удаление [Object]
	func save(_ objects: [Object]) {
		let realm = try! Realm()
		write {
			realm.add(objects, update: .all)
		}
	}
	// запиись write
	func write(_ closure: @escaping VoidClosure) {
		let realm = try! Realm()
		try! realm.write {
			closure()
		}
	}
	
	// retrieveObjects Object
	func retrieveObjects<T: Object>(of type: T.Type) -> [T] {
		let realm = try! Realm()
		return Array(realm.objects(type))
	}
}
