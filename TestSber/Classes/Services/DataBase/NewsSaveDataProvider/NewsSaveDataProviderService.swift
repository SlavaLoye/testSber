//
//  NewsSaveDataProviderService.swift
//  TestSber
//
//  Created by Viacheslav Loie on 06.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

protocol NewsSaveDataProviderService: class {
	func currentCount(of news: RSSItem) -> String
	func add(newsItem: RSSItem, with title: String)
}
