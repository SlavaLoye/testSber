//
//  DescriptionTableViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell, SelfConfiguringCell {
	
	// MARK: - reuseId
	static var reuseId: String = "DescriptionTableViewCell"
	
	var widthConstraint: NSLayoutConstraint!
	
	// MARK: - viewNews
	let viewNews = UIView()
	
	// MARK: - reuseId
	let lineViews = UIView()
	
	// MARK: - newsLabel
	let newsLabel = UILabel()
	
	// MARK: - init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViewNews()
		addTitleLabel()
		lineView()
	}
	
	
	// MARK: - configureCell
	func configureCell(news: String)  {

//		if let news = news {
			newsLabel.text = news.removeHTMLAndStringTemplates
	//	}
	}
	
	// MARK: - setupConstraints
	func setupViewNews() {
		addSubview(viewNews)
		viewNews.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
	}
	
	func lineView() {
		viewNews.addSubview(lineViews)
		lineViews.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		lineViews.frame = CGRect(x: 30, y: 1, width: viewNews.bounds.width - 60, height: 1)
	}
	
	
	// MARK: - addTitleLbel
	func addTitleLabel()  {
		viewNews.addSubview(newsLabel)
		newsLabel.translatesAutoresizingMaskIntoConstraints = false
		newsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        newsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        newsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        newsLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		newsLabel.textAlignment = .left
		newsLabel.numberOfLines = 0
		newsLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
		newsLabel.font = UIFont.systemFont(ofSize: 15)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
