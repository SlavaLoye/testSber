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
	
    @objc dynamic var title: String = "1"
    @objc dynamic var descriptions: String = ""
    @objc dynamic var pubDate: String = ""
	@objc override class func primaryKey() -> String? { return "title" }
	
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
}


