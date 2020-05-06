//
//  XMLParserService.swift
//  TestSber
//
//  Created by Viacheslav Loie on 27.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

protocol XMLParserService: class {
	func parseFeed(url: String, completionHandler:  @escaping ItemClosure<[RSSItem]>)
}
