//
//  NewsSaveDataProviderServiseImplemintation.swift
//  TestSber
//
//  Created by Viacheslav Loie on 06.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import RealmSwift
import Realm
import UIKit

class NewsSaveDataProviderServiceImplemintation: NewsSaveDataProviderService {

	// MARK: - News
	private(set) var rssSaveItems: News = News()
	private let realmService: RealmService
	
	// MARK: - init
	init(realmService: RealmService) {
		self.realmService = realmService
	}
	
	func currentCount(of news: RSSItem) -> String {
		return rssSaveItems.rssNews.first(where: { (subNews) -> Bool in
			return news.title == subNews.title
		})?.title ?? ""
	}
	
	func add(newsItem: RSSItem, with title: String) {
		
		guard title.count > 0 && currentCount(of: newsItem) + title <= newsItem.title else {
			return
		}
		let firstIndex = rssSaveItems.rssNews.firstIndex(where: { (subNews) -> Bool in
			return newsItem.title == subNews.titleNews?.title
		})
		realmService.save(newsItem)
		realmService.write {
			if let index = firstIndex {
				self.rssSaveItems.newsList[index].title += title
			} else {
				self.rssSaveItems.newsList.append(NewsModel(news: newsItem, title: title))
			}
		}
	}
}
