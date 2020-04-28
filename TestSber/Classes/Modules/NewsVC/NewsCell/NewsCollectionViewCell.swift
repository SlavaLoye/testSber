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
	var widthConstraint: NSLayoutConstraint!
	
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
	
	// MARK: - init
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupConstraints()
		addTitleLabel()
		addHeaderLabel()
		timerLabesl()
		self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
		widthConstraint?.constant = screenWidth - (2 * 12)
		headerLabel.text = "Новости"
		timerLabel.text = "12.03.2020"
	}
	
	// MARK: - configureCell
	func configureCell(header: String?, timer: String?, news: String?)  {
		if let header = header {
			headerLabel.text = header
		} else {
			print("Error")
		}
		if let timer = timer {
			timerLabel.text = timer
		} else {
			print("Error")
		}
		if let news = news {
			newsLabel.text = news
		}
	}
	
	// MARK: - setupConstraints
	func setupConstraints() {
		addSubview(viewNews)
		viewNews.layer.borderColor = #colorLiteral(red: 0.03126144037, green: 0.6027181745, blue: 0.05432835966, alpha: 1)
		viewNews.layer.borderWidth = 1
		viewNews.layer.cornerRadius = 10
		viewNews.frame = self.bounds
	}
	
	// MARK: - addTitleLbel
	func addTitleLabel()  {
		viewNews.addSubview(newsLabel)
		newsLabel.translatesAutoresizingMaskIntoConstraints = false
		newsLabel.textAlignment = .left
		newsLabel.numberOfLines = 0
		newsLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
		//newsLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
		newsLabel.font = UIFont.regular14
		newsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
		newsLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
		newsLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
		newsLabel.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: bottomAnchor, multiplier: -25).isActive = true
		newsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
	}
	
	// MARK: - addHeaderLabel
	func addHeaderLabel()  {
		viewNews.addSubview(headerLabel)
		headerLabel.textAlignment = .left
		headerLabel.numberOfLines = 1
		headerLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		headerLabel.font = UIFont.regular14
		headerLabel.frame = CGRect(x: 16, y: 16, width: 100, height: 15)
	}
	
	// MARK: - timerLabelLabel
	func timerLabesl()  {
		viewNews.addSubview(timerLabel)
		timerLabel.textAlignment = .right
		timerLabel.numberOfLines = 0
		timerLabel.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
		timerLabel.font = UIFont.regular14
		timerLabel.frame = CGRect(x: viewNews.bounds.width - 95, y: 16, width: 80, height: 15)
	}
	// MARK: - timerLabelLabel
	func readMoreLabels()  {
		viewNews.addSubview(readMoreLabel)
		//headerLabel.translatesAutoresizingMaskIntoConstraints = false
		readMoreLabel.textAlignment = .right
		readMoreLabel.numberOfLines = 0
		readMoreLabel.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
		readMoreLabel.font = UIFont.regular14
		readMoreLabel.frame = CGRect(x: viewNews.bounds.width - 95, y: 16, width: 80, height: 15)
	}

	
	// MARK: - configure
	func configure(with intValue: Int) {
		print("123")
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
