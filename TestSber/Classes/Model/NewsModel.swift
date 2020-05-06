//
//  NewsModel.swift
//  TestSber
//
//  Created by Viacheslav Loie on 06.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//


import Foundation
import RealmSwift
import Realm

class NewsModel: Object {
	
	@objc dynamic var title: String = UUID.init().uuidString
	
	var titleNews: RSSItem? {
		let realm = try! Realm()
		return realm.object(ofType: RSSItem.self, forPrimaryKey: title)
	}
	
	convenience init(news: RSSItem, title: String) {
		self.init()
		self.title = news.title
	}
}

