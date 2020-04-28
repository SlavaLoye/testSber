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
		readMoreLabels()
		self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
		widthConstraint?.constant = screenWidth - (2 * 12)
		
	}
	
	// MARK: - configureCell
	func configureCell(header: String?, timer: String?, news: String?)  {
		if let header = header {
			headerLabel.text = header
		}
		if let timer = timer {
			timerLabel.text = timer.deleteHTMLTags(tags: [timer])
		}
		if let news = news {
			newsLabel.text = news.deleteHTMLTags(tags: [news])
		}
	}
	
	// MARK: - setupConstraints
	func setupConstraints() {
		addSubview(viewNews)
		viewNews.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		viewNews.layer.borderWidth = 1
		viewNews.layer.cornerRadius = 10
		viewNews.frame = self.bounds
	}
	
	// MARK: - addTitleLbel
	func addTitleLabel()  {
		viewNews.addSubview(newsLabel)
		newsLabel.textAlignment = .left
		newsLabel.numberOfLines = 0
		newsLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
		//newsLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
		newsLabel.font = UIFont.regular14
		newsLabel.frame = CGRect(x: 16, y: 100, width: viewNews.bounds.width - 30, height: 140)
	}
	
	// MARK: - addHeaderLabel
	func addHeaderLabel()  {
		viewNews.addSubview(headerLabel)
		headerLabel.textAlignment = .left
		headerLabel.numberOfLines = 0
		headerLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		//headerLabel.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
		headerLabel.font = UIFont.semibold22
		headerLabel.frame = CGRect(x: 16, y: 16, width: viewNews.bounds.width - 30, height: 54)
	}
	
	// MARK: - timerLabelLabel
	func timerLabesl()  {
		viewNews.addSubview(timerLabel)
		timerLabel.textAlignment = .left
		timerLabel.numberOfLines = 0
		timerLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
		//timerLabel.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
		timerLabel.font = UIFont.regular14
		timerLabel.frame = CGRect(x: 16, y: 80, width: viewNews.bounds.width - 30, height: 15)
	}
	// MARK: - timerLabelLabel
	func readMoreLabels()  {
		viewNews.addSubview(readMoreLabel)
		readMoreLabel.textAlignment = .right
		readMoreLabel.numberOfLines = 0
		readMoreLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
		readMoreLabel.font = UIFont.regular14
		readMoreLabel.frame = CGRect(x: viewNews.bounds.width - 130, y: 245, width: 120, height: 15)
		readMoreLabel.text =  NSLocalizedString("title.readMoreTitle", comment: "Читать далее...")
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
