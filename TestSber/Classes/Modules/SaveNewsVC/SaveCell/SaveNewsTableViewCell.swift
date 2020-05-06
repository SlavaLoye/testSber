//
//  SaveNewsCollectionViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class SaveNewsTableViewCell : UITableViewCell, SelfConfiguringCell {
	
	// MARK: - reuseId
	static var reuseId: String = "SaveNewsTableViewCell"
	
	var rssItems: [RSSItem] = []
	
	var widthConstraint: NSLayoutConstraint!
	
	// MARK: - reuseId
	let viewNews = UIView()
	
	// MARK: - reuseId
	let lineView = UIView()
	
	// MARK: - headerLabel
	let headerLabel = UILabel()
	
	// MARK: - newsLabel
	let newsLabel = UILabel()
	
	// MARK: - timerLabel
	let timerLabel = UILabel()
	
	// MARK: - readMoreLabel
	let readMoreLabel = UILabel()
	
	// MARK: - imageView
	let imageViews = UIImageView()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
	super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViewNews()
		addTitleLabel()
		addHeaderLabel()
		timerLabesl()
		readMoreLabels()
		imageViewNews()
		lineViewNews()
	}
	
	// MARK: - configureCell
	func configureCell(header: String?, timer: String?, news: String?, isImages: Bool)  {
		if isImages {
			imageViews.imageFromServerURL(urlString: TemplateURL.imgBanki.rawValue)
		} else {
			imageViews.imageFromServerURL(urlString: TemplateURL.finamRU.rawValue)
		}
		if let header = header {
			headerLabel.text = header
		}
		if let timer = timer {
			timerLabel.text = timer.removeHTMLAndStringTemplates
		}
		if let news = news {
			newsLabel.text = news.removeHTMLAndStringTemplates
		}
	}
	
	// MARK: - imageViewNews
	func imageViewNews() {
		imageViews.frame = CGRect(x: 16, y: 245, width: 60, height: 20)
		viewNews.addSubview(imageViews)
	}
	
	// MARK: - setupViewNews
	func setupViewNews() {
		addSubview(viewNews)
		viewNews.frame = CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width - 20, height: 300)
	}
	
	// MARK: - setupViewNews
	func lineViewNews() {
		viewNews.addSubview(lineView)
		lineView.backgroundColor = UIColor.sberGreen
		lineView.frame = CGRect(x: 10, y: 280, width: viewNews.bounds.width - 10, height: 1)
	}
	
	// MARK: - addTitleLbel
	func addTitleLabel()  {
		viewNews.addSubview(newsLabel)
		newsLabel.textAlignment = .left
		newsLabel.numberOfLines = 0
		newsLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
		newsLabel.font = UIFont.systemFont(ofSize:14)
		newsLabel.frame = CGRect(x: 16, y: 100, width: viewNews.bounds.width - 30, height: 140)
	}
	
	// MARK: - addHeaderLabel
	func addHeaderLabel()  {
		viewNews.addSubview(headerLabel)
		headerLabel.textAlignment = .left
		headerLabel.numberOfLines = 0
		headerLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		headerLabel.font = UIFont.systemFont(ofSize: 22)
		headerLabel.frame = CGRect(x: 16, y: 16, width: viewNews.bounds.width - 30, height: 54)
	}
	
	// MARK: - timerLabelLabel
	func timerLabesl()  {
		viewNews.addSubview(timerLabel)
		timerLabel.textAlignment = .left
		timerLabel.numberOfLines = 0
		timerLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
		timerLabel.font = UIFont.systemFont(ofSize: 14)
		timerLabel.frame = CGRect(x: 16, y: 80, width: viewNews.bounds.width - 30, height: 15)
		
	}
	// MARK: - readMoreLabels
	func readMoreLabels()  {
		viewNews.addSubview(readMoreLabel)
		readMoreLabel.textAlignment = .right
		readMoreLabel.numberOfLines = 0
		readMoreLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
		readMoreLabel.font = UIFont.systemFont(ofSize: 14)
		readMoreLabel.frame = CGRect(x: viewNews.bounds.width - 130, y: 245, width: 120, height: 15)
		readMoreLabel.text = NSLocalizedString("title.readMore", comment: "Подробнее...")
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
