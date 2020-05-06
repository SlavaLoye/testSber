//
//  SaveNewsInteractor.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

class SaveNewsInteractor: SaveNewsPresenterOutConnection {
	
	var rssItems: [RSSItem] {
    return Array(recentlyRssService.rssItems.rssList)
  }
	//Недавно просмотреныне новсти
	var recentlyRssService: RecentlyViewedRSSService
  
	//MARK: - private
	private let xmlDataService: RssDataProviderService
	
	init(recentlyRssService: RecentlyViewedRSSService, xmlDataService: RssDataProviderService) {
		self.recentlyRssService = recentlyRssService
		self.xmlDataService = xmlDataService
	}
}
