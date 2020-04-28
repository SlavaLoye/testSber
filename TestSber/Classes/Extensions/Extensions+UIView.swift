//
//  Extensions+UIView.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//
import UIKit

extension UIView {
	
	func pinToSuperviewEdges(except directions: [Direction] = []) {
		guard let superView = superview else {
			return
		}
		translatesAutoresizingMaskIntoConstraints = false
		if !directions.contains(.top) {
			topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
		}
		if !directions.contains(.bottom) {
			bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
		}
		
		if !directions.contains(.leading) {
			leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
		}
		
		if !directions.contains(.trailing) {
			trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
		}
	}
}
