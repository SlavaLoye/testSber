//
//  RssDataProviderServiceImplementation.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

class RssDataProviderServiceImplementation: RssDataProviderService {
	
	// MARK: - realmService
	private let realmService: RealmService?
	
	// MARK: - rssNetworkService
	private let rssNetworkService: XMLParserService
	
	init(realmService: RealmService?, rssNetworkService: XMLParserService) {
		self.realmService = realmService
		self.rssNetworkService = rssNetworkService
	}
	
	// MARK: - parseFeed
	func parseFeed(url: String, completion: @escaping ItemClosure<[RSSItem]>) {
		let cachedRSS = self.realmService?.retrieveObjects(of: RSSItem.self) ?? []
		if !cachedRSS.isEmpty {
			DispatchQueue.main.async {
				completion(cachedRSS)
			}
		}
		
		rssNetworkService.parseFeed(url: url) {  (rss) in
			self.realmService?.save(rss)
			DispatchQueue.main.async {
				if !rss.isEmpty {
					completion(rss)
				}
			}
		}
	}
}
