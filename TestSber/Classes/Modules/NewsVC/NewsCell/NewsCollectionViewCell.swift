//
//  NewsCollectionViewCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell, NibLoadable, SelfConfiguringCell {
	
	static var reuseId: String = "NewsCollectionViewCell"
	let friendImageView: UIImageView = UIImageView()
	let backView: UIView = UIView()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		addBackView()
	}
	func addBackView() {
		addSubview(backView)
		backView.translatesAutoresizingMaskIntoConstraints = false
		backView.backgroundColor = #colorLiteral(red: 0.09620393068, green: 0.5219721198, blue: 0.1340354979, alpha: 1)
		//		backView.widthAnchor.constraint(equalToConstant: 260).isActive = true
		//		backView.heightAnchor.constraint(equalToConstant: 170).isActive = true
		//		backView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		//		backView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		backView.frame = self.bounds
		
	}
	
	func setupConstraints() {
		addSubview(friendImageView)
		friendImageView.translatesAutoresizingMaskIntoConstraints = false
		friendImageView.backgroundColor = .black
		friendImageView.image = UIImage(named: "robertsportrait")
		friendImageView.frame = self.bounds
	}
	
	func configure(with intValue: Int) {
		print("123")
	}
	
    
}
