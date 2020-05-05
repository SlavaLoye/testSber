//
//  RssDataProviderService.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

protocol RssDataProviderService {
	func parseFeed(url: String, completion:  @escaping ItemClosure<[RSSItem]>)
}

