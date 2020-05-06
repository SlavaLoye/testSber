//
//  Extensions+UIButton.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

extension UIButton {
	
	// MARK: - roundHeightWidthButton
	func roundHeightWidthButton() {
		self.layer.cornerRadius = self.bounds.height / 2
		self.contentMode = .scaleAspectFill
		self.clipsToBounds = true
	}
	
	// MARK: - roundedButton _ CGFloat
	func roundedButton(cornerRadius: CGFloat)  {
		self.layer.cornerRadius = cornerRadius
		self.layer.masksToBounds = true
	}
	
	// MARK: - roundedButton _ CGFloat
	func roundedButtonYellow(cornerRadius: CGFloat)  {
		self.layer.cornerRadius = cornerRadius
		self.layer.masksToBounds = true
		self.layer.borderWidth = 2
		self.layer.borderColor = #colorLiteral(red: 0.09711175412, green: 0.626296401, blue: 0.1582792997, alpha: 1)
	}
	
	// MARK: - startPulsate _ Animation
	func startPulsate() {
		let pulse = CASpringAnimation(keyPath: "transform.scale")
		pulse.duration = 0.4
		pulse.fromValue = 0.98
		pulse.toValue = 1.0
		pulse.autoreverses = true
		pulse.repeatCount = .infinity
		pulse.initialVelocity = 0.5
		pulse.damping = 1.0
		layer.add(pulse, forKey: nil)
	}
}

