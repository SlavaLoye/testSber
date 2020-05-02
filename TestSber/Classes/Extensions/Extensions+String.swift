//
//  Extensions+String.swift
//  TestSber
//
//  Created by Viacheslav Loie on 28.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation
import UIKit


extension String {
	
	// MARK: HTML text remove tags and symbols
	
	func deleteHTMLTag(tag: String) -> String {
		
		return self.replacingOccurrences(of: "(?i)</?\(tag)\\b[^<]*>", with: "", options: .regularExpression, range: nil)
	}
	
	func deleteHTMLTags(tags:[String]) -> String {
		
		var mutableString = self
		for tag in tags {
			mutableString = mutableString.deleteHTMLTag(tag: tag)
		}
		return mutableString
	}
	
	public var removeHTMLAndStringTemplates: String {
		
		let a = self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil).replacingOccurrences(of: "RSSItem", with: "Сбербанк News:").replacingOccurrences(of: "pubDate", with: "Время:").replacingOccurrences(of: "}", with: " ").replacingOccurrences(of: "{", with: " ").replacingOccurrences(of: "descriptions", with: " ").replacingOccurrences(of: "title", with:  " ").replacingOccurrences(of: "= ", with:  "").replacingOccurrences(of: ";", with: " ").replacingOccurrences(of: "&ndash", with: " и")
		return a.replacingOccurrences(of: "&[^;]+;", with: " ", options: String.CompareOptions.regularExpression, range: nil)
		
	}
	
	public var withoutHtmlTags: String {
		
		guard let data = self.data(using: .utf8) else {
			return self
		}
		
		let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
			.documentType: NSAttributedString.DocumentType.html,
			.characterEncoding: String.Encoding.utf8.rawValue
		]
		
		guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
			return self
		}
		
		return attributedString.string
	}
}
