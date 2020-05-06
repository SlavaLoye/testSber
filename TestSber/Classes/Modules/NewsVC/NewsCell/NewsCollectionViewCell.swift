//
//  NewsCollectionViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//


import UIKit

class NewsCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
	
	
	// MARK: - reuseId
	static var reuseId: String = "NewsCollectionViewCell"
	
	// MARK: - reuseId
	let viewNews = UIView()
	
	// MARK: - headerLabel
	let headerLabel = UILabel()
	
	// MARK: - newsLabel
	let newsLabel = UILabel()
	
	// MARK: - timerLabel
	let timerLabel = UILabel()
	
	// MARK: - readMoreLabel
	let readMoreLabel = UILabel()
	
	// MARK: - newsButton
	let newsButton = UIButton()
	
	// MARK: - imageView
	let imageView = UIImageView()
	
	// MARK: - init
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViewNews()
		addTitleLabel()
		addHeaderLabel()
		timerLabesl()
		readMoreLabels()
		imageViewNews()
	}
	
	// MARK: - configureCell
	func configureCell(header: String?, timer: String?, news: String?, isImages: Bool, isActive: Bool)  {
		
		if isImages {
			imageView.imageFromServerURL(urlString: TemplateURL.imgBanki.rawValue)
		} else {
			imageView.imageFromServerURL(urlString: TemplateURL.finamRU.rawValue)
		}
		if let header = header {
			headerLabel.text = header.removeHTMLAndStringTemplates
		}
		if let timer = timer {
			timerLabel.text = timer.removeHTMLAndStringTemplates
		}
		if let news = news {
			newsLabel.text = news.removeHTMLAndStringTemplates
		}
	}
	
	// MARK: - setupConstraints
	func setupViewNews() {
		addSubview(viewNews)
		viewNews.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		viewNews.layer.borderWidth = 1
		viewNews.layer.cornerRadius = 10
		viewNews.frame = self.bounds
	}
	
	// MARK: - addHeaderLabel
	func addHeaderLabel()  {
		viewNews.addSubview(headerLabel)
		headerLabel.textAlignment = .left
		headerLabel.numberOfLines = 0
		headerLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		headerLabel.font = UIFont.semibold22
		headerLabel.frame = CGRect(x: 16, y: 16, width: viewNews.bounds.width - 30, height: 60)
	}
	
	// MARK: - timerLabelLabel
	func timerLabesl()  {
		viewNews.addSubview(timerLabel)
		timerLabel.textAlignment = .left
		timerLabel.numberOfLines = 0
		timerLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
		timerLabel.font = UIFont.regular14
		timerLabel.frame = CGRect(x: 16, y: 80, width: viewNews.bounds.width - 30, height: 15)
	}
	
	// MARK: - addTitleLbel
	func addTitleLabel()  {
		viewNews.addSubview(newsLabel)
		newsLabel.textAlignment = .left
		newsLabel.numberOfLines = 8
		newsLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
		newsLabel.font = UIFont.regular15
		newsLabel.frame = CGRect(x: 16, y: 100, width: viewNews.bounds.width - 30, height: viewNews.bounds.height / 2)
	}
	
	// MARK: - timerLabelLabel
	func readMoreLabels()  {
		viewNews.addSubview(readMoreLabel)
		readMoreLabel.textAlignment = .right
		readMoreLabel.numberOfLines = 0
		readMoreLabel.textColor = #colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.2666666806, alpha: 1)
		readMoreLabel.font = UIFont.regular14
		readMoreLabel.frame = CGRect(x: viewNews.bounds.width - 130, y: 245, width: 120, height: 15)
		readMoreLabel.text =  NSLocalizedString("title.readMoreTitle", comment: "Читать далее...")
	}
		
	// MARK: - imageViewNews
	func imageViewNews() {
		imageView.frame = CGRect(x: 16, y: 245, width: 60, height: 20)
		viewNews.addSubview(imageView)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

