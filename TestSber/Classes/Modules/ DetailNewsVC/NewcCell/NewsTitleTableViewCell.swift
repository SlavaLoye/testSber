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

	var widthConstraint: NSLayoutConstraint!
	 
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
		 viewNews.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
	 }
	 
	 // MARK: - addHeaderLabel
	 func titlelLabel()  {
		 viewNews.addSubview(titleLabel)
		 titleLabel.textAlignment = .left
		 titleLabel.numberOfLines = 2
		 titleLabel.font = UIFont.semibold20
		 titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		 titleLabel.frame = CGRect(x: 30, y: 0, width: viewNews.bounds.width - 60, height: 60)
	 }
	 
	 required init?(coder: NSCoder) {
		 fatalError("init(coder:) has not been implemented")
	 }

}
