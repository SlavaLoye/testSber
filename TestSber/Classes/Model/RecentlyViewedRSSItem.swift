//
//  RecentlyViewedRSSItem.swift
//  TestSber
//
//  Created by Viacheslav Loie on 02.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import RealmSwift
import Realm

class RSSViewsItem: Object {
	typealias ProductType = RSSItem
	@objc dynamic var title: String = ""
	var rssList: List<RSSItem> = List()
	@objc override class func primaryKey() -> String? { return "title" }
}

