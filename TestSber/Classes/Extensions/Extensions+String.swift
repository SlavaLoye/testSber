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
		
		let a = self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
		return a.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
		
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


// Солетско-Ханавейского и Трехбугорного лицензионных участков ООО "Арктик СПГ<span lang="EN-US"></span>1"&shy;&ndash;очередного крупнотоннажного СПГ-проекта "НОВАТЭКа".</p><p>Ресурсный потенциал Бухаринского участка по российской классификации оценивается на уровне 1<span lang="EN-GB"></span>190млрд куб. м газа и 74 млн т жидких углеводородов, что в совокупности составляет 8,4<span lang="EN-GB"></span>млрд баррелей нефтяного эквивалента.</p><p>Компания намерена приступить к полномасштабным сейсморазведочным работам и бурению первой поисковой скважины в ближайший полевой сезон 2020-2021 гг.</p>;
//pubDate = Tue, 28 Apr 2020 11:30:19 +0300;
