//
//  SaveNewsInteractor.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

class SaveNewsInteractor: SaveNewsPresenterOutConnection {
	
	var rssItems: [RSSItem] = []
	
	//Недавно просмотреныне новсти
	var recentlyRssService: RecentlyViewedRSSService
	
	init(recentlyRssService: RecentlyViewedRSSService) {
		self.recentlyRssService = recentlyRssService
	}
}
