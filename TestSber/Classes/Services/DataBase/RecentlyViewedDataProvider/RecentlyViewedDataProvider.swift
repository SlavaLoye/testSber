//
//  RecentlyViewedDataProvider.swift
//  TestSber
//
//  Created by Viacheslav Loie on 02.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import RealmSwift
import Realm

class RecentlyViewedDataProviderImplemintation: RecentlyViewedRSSService {
	
	private let realmService: RealmService
	
	// MARK: RecentlyViewedRSSItem
	private(set) var rssItems: RSSViewsItem = RSSViewsItem()
	
	init(realmService: RealmService) {
		self.realmService = realmService
	}
	
	private func resave() {
		realmService.save(rssItems)
	}
	
	// MARK: add()
	func add(rss: RSSItem) {
		if self.rssItems.rssList.first(where: { (savedRSSItem) -> Bool in
			return savedRSSItem.title == rss.title
		}) == nil {
			realmService.save(rss)
			realmService.write {
				self.rssItems.rssList.append(rss)
			}
			
			while self.rssItems.rssList.count > 10 {
				realmService.write {
					self.rssItems.rssList.removeFirst()
				}
			}
			resave()
		}
	}
	
	// MARK: loadCachedList()
	func loadCachedList() {
		guard let rssItems = realmService.retrieveObjects(of: RSSViewsItem.self).first else {
			return
		}
		
		self.rssItems = rssItems
	}
	
	// MARK: clear()
	func clear() {
		rssItems.rssList = List()
		resave()
	}
}

