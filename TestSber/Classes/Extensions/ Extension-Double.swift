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
		/// Приводим строку к формату `Double` десятичный разделитель точка
		let value = self.replacingOccurrences(of: ",", with: ".")
		/// Любые символы котоыре не подходят для числа
		let allowedCharacter = CharacterSet.decimalDigits.union (CharacterSet (charactersIn: "."))
		/// Убираем все не числа, пробуем создать `Double`
		return Double(value.trimmingCharacters(in: allowedCharacter.inverted).trimmingCharacters(in: CharacterSet.whitespaces).replacingOccurrences(of: " ", with: "")) ?? 0
	}
}

