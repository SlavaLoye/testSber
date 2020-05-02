//
//  NewsPresenterOutConnection.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

protocol NewsPresenterOutConnection: class {
	var rssItems: [RSSItem] { get set}
	func parseFeed(url: String, completion: @escaping ItemClosure<[RSSItem]>)
}
