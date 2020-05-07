//
//  NotNewsView.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NotNewsView: UIView, NibLoadable {
	
	// MARK: - searchButton
	var searchButton: UIButton = UIButton()
	
	// MARK: - viewNews
	var viewNews: UIView = UIView()
	var addButton: UIButton = UIButton()
	
	// MARK: - screenShouldBeClosed
	var screenShouldBeClosed: (() -> Void)?
	
	
	// MARK: - didMoveToSuperview
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		addTarget()
		addView()
		addLabel()
	}
	
	// MARK: - layoutSubviews
	override func layoutSubviews() {
		super.layoutSubviews()
		decorate()
	}
	
	// MARK: - addTarget
	func addTarget()  {
		searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
	}
	
	// MARK: - searchButtonAction
	@objc func searchButtonAction() {
		screenShouldBeClosed?()
	}
	
	// MARK: - decorate
	func decorate()  {
		searchButton.roundedButtonSberColor(cornerRadius: 25)
		searchButton.layer.borderColor = #colorLiteral(red: 0.09711175412, green: 0.626296401, blue: 0.1582792997, alpha: 1)
	}
	
	// MARK: - addView
	func addView() {
		addSubview(viewNews)
		viewNews.translatesAutoresizingMaskIntoConstraints = false
		viewNews.topAnchor.constraint(equalTo: topAnchor).isActive = true
		viewNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		viewNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		viewNews.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	// MARK: - addLabel
	func addLabel() {
		viewNews.addSubview(addButton)
		addButton.translatesAutoresizingMaskIntoConstraints = false
		addButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
		addButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
	}
}
