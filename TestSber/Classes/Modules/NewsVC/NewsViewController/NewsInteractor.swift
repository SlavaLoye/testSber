//
//  NewsInteractor.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

class NewsInteractor: NewsPresenterOutConnection {
	
	//MARK: - rssItems
	var rssItems: [RSSItem] = []
	
	//MARK: - private
	private let xmlDataService: RssDataProviderService?
	
	//MARK: - init
	init(xmlDataService: RssDataProviderService?) {
		self.xmlDataService = xmlDataService
	}

	//MARK: - parseFeed
	func parseFeed(url: String, completion: @escaping ItemClosure<[RSSItem]>) {
		xmlDataService?.parseFeed(url: url, completion: { (rssItems) in
			self.rssItems = rssItems
			completion(rssItems)
		})
	}
}
