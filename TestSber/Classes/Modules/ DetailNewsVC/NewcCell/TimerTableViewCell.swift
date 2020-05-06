//
//  TimerTableViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell, SelfConfiguringCell {
	
	static var reuseId: String = "TimerTableViewCell"
	
	// MARK: - reuseId
	let viewNews = UIView()
	
	// MARK: - timerLabel
	let timerLabel = UILabel()
	
	// MARK: - imageView
	let imageViews = UIImageView()
	
	//let isImages: Bool = false

	// MARK: - init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViewNews()
		timerLabesl()
		imageViewNews()
	}
	
	// MARK: - configureCell
	func configureCell(timer: String?, isImages: Bool)  {
		if isImages {
			imageViews.imageFromServerURL(urlString: TemplateURL.imgBanki.rawValue)
		} else {
			imageViews.imageFromServerURL(urlString: TemplateURL.imgFinam.rawValue)
		}
		if let timer = timer {
			timerLabel.text = timer.removeHTMLAndStringTemplates
		}
	}

	// MARK: - setupConstraints
	func setupViewNews() {
		addSubview(viewNews)
		viewNews.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
	}

	// MARK: - timerLabelLabel
	func timerLabesl()  {
		viewNews.addSubview(timerLabel)
		timerLabel.textAlignment = .left
		timerLabel.numberOfLines = 0
		timerLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
		timerLabel.font = UIFont.systemFont(ofSize: 14)
		timerLabel.frame = CGRect(x: 30, y: 16, width: viewNews.bounds.width - 60, height: 15)
		
	}
	
	// MARK: - imageViewNews
	func imageViewNews() {
		imageViews.frame = CGRect(x: viewNews.bounds.width - 100, y: 16, width: 60, height: 20)
		viewNews.addSubview(imageViews)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
