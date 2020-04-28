//
//  Loader.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

final class Loader {
	private let view: UIView
	init(view: UIView) {
		self.view = view
	}
	
	private let loaderView = UIActivityIndicatorView(style: .gray)
	private let backView = UIView()
	
	func show() {
		guard !view.subviews.contains(loaderView) else {
			return
		}
		view.addSubview(backView)
		backView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
		backView.pinToSuperviewEdges()
		
		view.addSubview(loaderView)
		loaderView.translatesAutoresizingMaskIntoConstraints = false
		loaderView.tintColor = .red
		loaderView.startAnimating()
		loaderView.heightAnchor.constraint(equalToConstant: 128).isActive = true
		loaderView.widthAnchor.constraint(equalToConstant: 128).isActive = true
		loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
	func hide() {
		guard view.subviews.contains(loaderView) else {
			return
		}
		loaderView.removeFromSuperview()
		backView.removeFromSuperview()
	}
}
