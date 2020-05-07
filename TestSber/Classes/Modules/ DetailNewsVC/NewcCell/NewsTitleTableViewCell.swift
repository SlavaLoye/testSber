//
//  NewsTitleTableViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsTitleTableViewCell: UITableViewCell, SelfConfiguringCell {
	
	static var reuseId: String = "NewsTitleTableViewCell"
	
	// MARK: - reuseId
	let viewNews = UIView()
	
	// MARK: - titleLabel
	let titleLabel = UILabel()
	
	// MARK: - init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViewNews()
		titlelLabel()
	}
	
	
	// MARK: - configureCell
	func configureCell(header: String?)  {
		if let header = header {
			titleLabel.text = header
		}
	}
	
	// MARK: - setupConstraints
	func setupViewNews() {
		addSubview(viewNews)
		viewNews.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		viewNews.translatesAutoresizingMaskIntoConstraints = false
		viewNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		viewNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		viewNews.topAnchor.constraint(equalTo: topAnchor).isActive = true
		viewNews.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

	}
	
	// MARK: - addHeaderLabel
	func titlelLabel()  {
		viewNews.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
		titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
		titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		titleLabel.numberOfLines = 0
		titleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
		titleLabel.textAlignment = .left
		titleLabel.font = UIFont.systemFont(ofSize: 20)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
