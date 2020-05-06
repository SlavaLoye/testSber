//
//  Extension+UIColor.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

// Sample color palette (color из дизайна)
extension UIColor {
	@nonobjc class var yellow: UIColor {
		return UIColor(red: 254.0 / 255.0, green: 207.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
	}
	@nonobjc class var sberGreen: UIColor {
		return UIColor(red: 25.0 / 255.0, green: 160.0 / 255.0, blue: 40.0 / 255.0, alpha: 1.0)
	}
	@nonobjc class var peach: UIColor {
		return UIColor(red: 238.0 / 255.0, green: 103.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
	}
	@nonobjc class var veryLightPinkTwo: UIColor {
		return UIColor(white: 239.0 / 255.0, alpha: 1.0)
	}
}
// Sample text styles
extension UIFont {
	class var header: UIFont {
		return UIFont.systemFont(ofSize: 24.0, weight: .regular)
	}
}

