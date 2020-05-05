//
//  SaveNewsPresenterOutConnection.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

protocol SaveNewsPresenterOutConnection {
	var rssItems: [RSSItem] { get set}
	//Недавно просмотреныне новости
	var recentlyRssService: RecentlyViewedRSSService { get }
	func parseFeed(url: String, completion: @escaping ItemClosure<[RSSItem]>)
	
}
