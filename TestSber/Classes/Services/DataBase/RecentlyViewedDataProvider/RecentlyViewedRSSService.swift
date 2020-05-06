//
//  RecentlyViewedRSSService.swift
//  TestSber
//
//  Created by Viacheslav Loie on 02.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

protocol RecentlyViewedRSSService: class {
	var rssItems: RSSViewsItem { get }
	func add(rss: RSSItem)
	func loadCachedList()
	func clear()
}
