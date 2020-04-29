//
//  TitleTableViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell, SelfConfiguringCell {
	
	// MARK: - reuseId
	static var reuseId: String = "TitleTableViewCell"
	
	// MARK: - widthConstraint
	var widthConstraint: NSLayoutConstraint!
	
	// MARK: - closeButtonClicked
	var closeButtonClicked: VoidClosure?
	
	// MARK: - reuseId
	let viewNews = UIView()
	
	// MARK: - titleLabel
	let titleLabel = UILabel()
	
	// MARK: - titleLabel
	let closeButton = UIButton()
	
	// MARK: - init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViewNews()
		titlelLabel()
		closesButton()
		addTarget()
	}
	
	// MARK: - addTarget()
	private func addTarget()  {
		closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
	}
	
	@objc private func closeButtonAction() {
		closeButtonClicked?()
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
		viewNews.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
	}
	
	// MARK: - addHeaderLabel
	func titlelLabel()  {
		viewNews.addSubview(titleLabel)
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 0
		titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		//titleLabel.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
		titleLabel.font = UIFont.semibold20
		titleLabel.textColor = UIColor.sberGreen
		titleLabel.frame = CGRect(x: 60, y: 0, width: viewNews.bounds.width - 120, height: 44)
	}
	
	// MARK: - addHeaderLabel
	func closesButton()  {
		viewNews.addSubview(closeButton)
		//closeButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
		closeButton.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
		closeButton.tintColor = #colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1)
		closeButton.frame = CGRect(x: viewNews.bounds.width - 60, y: 0, width: 44, height: 44)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

