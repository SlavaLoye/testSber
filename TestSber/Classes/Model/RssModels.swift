//
//  RssModels.swift
//  TestSber
//
//  Created by Viacheslav Loie on 27.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

final class RSSItem: Object {
	
    @objc dynamic var title: String = ""
    @objc dynamic var descriptions: String = ""
    @objc dynamic var pubDate: String = ""
	@objc override class func primaryKey() -> String? { return "pubDate" }
	
	convenience init(title: String, descriptions: String, pubDate: String ) {
		self.init()
		self.title = title
		self.descriptions = descriptions
		self.pubDate = pubDate
	}
	
    enum CodingKeys: String, CodingKey {
      case title = "title"
      case descriptions = "description"
      case pubDate = "pubDate"
	}
	
	var pubDateDouble: Double {
		return pubDate.toDouble()
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


