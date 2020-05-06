//
//   Extension-Double.swift
//  TestSber
//
//  Created by Viacheslav Loie on 30.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

extension String {
	func toDouble() -> Double {
		let value = self.replacingOccurrences(of: ",", with: ".")
		let allowedCharacter = CharacterSet.decimalDigits.union (CharacterSet (charactersIn: "."))
		return Double(value.trimmingCharacters(in: allowedCharacter.inverted).trimmingCharacters(in: CharacterSet.whitespaces).replacingOccurrences(of: " ", with: "")) ?? 0
	}
}

