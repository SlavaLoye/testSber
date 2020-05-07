//
//  News.swift
//  TestSber
//
//  Created by Viacheslav Loie on 06.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import RealmSwift

class News: Object {
	
	typealias NewsType = NewsModel
	
	@objc dynamic var title: String = UUID.init().uuidString
	
	var newsList: List<NewsModel> = List()
	
	var rssNews: [NewsType] {
		return Array(newsList)
	}
	
	var mainCount: Int {
		return rssNews.count
	}
	
	@objc override class func primaryKey() -> String? { return "title" }

}
