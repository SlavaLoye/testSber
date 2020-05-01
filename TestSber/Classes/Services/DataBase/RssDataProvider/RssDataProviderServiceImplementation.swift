//
//  RssDataProviderServiceImplementation.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

class RssDataProviderServiceImplementation: RssDataProviderService {
	private let realmService: RealmService
	private let rssNetworkService: XMLParserService
	
	init(realmService: RealmService, rssNetworkService: XMLParserService) {
		self.realmService = realmService
		self.rssNetworkService = rssNetworkService
	}
	
	func parseFeed(url: String, completionHandler: @escaping ItemClosure<[RSSItem]>) {
			let cachedRSS = self.realmService.retrieveObjects(of: RSSItem.self)
			if !cachedRSS.isEmpty {
				DispatchQueue.main.async {
					completionHandler(cachedRSS)
				}
			}
			
			rssNetworkService.parseFeed(url: url) { [weak self]  (rss) in
				self?.realmService.save(rss)
			DispatchQueue.main.async {
				if !rss.isEmpty {
					completionHandler(rss)
				}
			}
		}
	}
}
