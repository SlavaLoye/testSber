//
//  DescriptionTableViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell, SelfConfiguringCell {
	
	static var reuseId: String = "DescriptionTableViewCell"
	
	var widthConstraint: NSLayoutConstraint!
	
	// MARK: - reuseId
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
	func configureCell(news: String?)  {

		if let news = news {
			newsLabel.text = news.deleteHTMLTags(tags: [news])
		}
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
//		newsLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
		newsLabel.font = UIFont.regular14
		newsLabel.text = "Будучи современным языком высокого уровня, Swift в основном берёт на себя управление памятью в ваших приложениях, занимаясь выделением и освобождением памяти. Это происходит благодаря механизму, который называется Automatic Reference Counting, или сокращенно ARC. В этом руководстве вы разберётесь, как работает ARC и как правильно управлять памятью в Swift. Понимая этот механизм, вы сможете влиять на время жизни объектов, размещенных в куче (heap). Будучи современным языком высокого уровня, Swift в основном берёт на себя управление памятью в ваших приложениях, занимаясь выделением и освобождением памяти. Это происходит благодаря механизму, который называется Automatic Reference Counting, или сокращенно ARC. В этом руководстве вы разберётесь, как работает ARC и как правильно управлять памятью в Swift. Понимая этот механизм, вы сможете влиять на время жизни объектов, размещенных в куче (heap)."
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
