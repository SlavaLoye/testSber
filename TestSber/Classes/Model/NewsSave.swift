//
//  NewsSave.swift
//  TestSber
//
//  Created by Viacheslav Loie on 30.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//


import Foundation
import RealmSwift
import Realm

class NewsSave: Object {

  @objc dynamic var count: Int = 0
  @objc dynamic var productId: Int = 0
//
//
//  var product: RSSItem? {
//    let realm = try! Realm()
//    return realm.object(ofType: Product.self, forPrimaryKey: productId)
//
//  }
//
//  var oldPrice: Double {
//    return product?.oldPriceFloat ?? 0
//  }
//
//	var quantity: Int {
//		return product?.quantity ?? 0
//	}
//
//	var existing: Bool {
//		return (product?.existing ?? 0) != 0
//	}
//
//	var discount: Double {
//		return product?.discountFloat ?? 0
//	}
//
//  convenience init(product: Product, count: Int) {
//    self.init()
//    self.productId = product.obiID
//    self.count = count
//  }
}
