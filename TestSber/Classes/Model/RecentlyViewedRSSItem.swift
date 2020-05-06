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
	
	typealias NewsType = RSSItem
	
	@objc dynamic var title: String = UUID.init().uuidString
	@objc dynamic var descriptions: String = ""
    @objc dynamic var pubDate: String = ""
	
	var rssList: List<RSSItem> = List()
	
	@objc override class func primaryKey() -> String? { return "title" }
	
	convenience init(title: String, descriptions: String, pubDate: String ) {
		self.init()
		self.title = title
		self.descriptions = descriptions
		self.pubDate = pubDate
	}
	
	enum CodingKeys: String, CodingKey {
		case title = "title"
		case descriptions = "descriptions"
		case pubDate = "pubDate"
	}
	
	required init (from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		title = try container.decode(String.self, forKey: .title)
		descriptions = try container.decode(String.self, forKey: .descriptions)
		pubDate = try container.decode(String.self, forKey: .pubDate)
	}
	
	required init() {
		//fatalError("init() has not been implemented")
	}
}

