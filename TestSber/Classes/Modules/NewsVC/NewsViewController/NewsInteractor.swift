//
//  NewsInteractor.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

class NewsInteractor: NewsPresenterOutConnection {

	var rssItems: [RSSItem] = []
	private let xmlService: XMLParserService?
	
	init(xmlService: XMLParserService) {
		self.xmlService = xmlService
	}


	func parseFeed(url: String, completionHandler: @escaping ItemClosure<[RSSItem]>) {
		xmlService?.parseFeed(url: url, completionHandler: { (rssItems) in
			self.rssItems = rssItems
			completionHandler(rssItems)
		})
	}
}
