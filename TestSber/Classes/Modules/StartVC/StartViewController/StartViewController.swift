//
//  StartViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, StartViewInConnection {
	
	var presenter: StartPresenter!
	
	convenience init(presenter: StartPresenter?) {
	  self.init()
	  self.presenter = presenter
	}

	
	// MARK: private var
	private var imageLogo: UIImageView = UIImageView()
	private var titleLabel: UILabel = UILabel()
	private var openButton: UIButton = UIButton()
	
	// MARK: viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		addTarget()
		addImages()
		addLabel()
		addButton()
	}
	
	// MARK: viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		openButton.pulsate()
	}
	
	// MARK: addTarget
	private func addTarget()  {
		openButton.addTarget(self, action: #selector(openButtonAction), for: .touchUpInside)
	}
	
	// MARK: openButtonAction
	@objc private func openButtonAction() {
		presenter?.selectButtonClicked()
		print("selectButtonClicked")
	}
	
	// MARK: - addImages
	private func addImages() {
		view.addSubview(imageLogo)
		imageLogo.image = UIImage(named: "icon200")
		imageLogo.translatesAutoresizingMaskIntoConstraints = false
		imageLogo.widthAnchor.constraint(equalToConstant: 100).isActive = true
		imageLogo.heightAnchor.constraint(equalToConstant: 100).isActive = true
		imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		imageLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
	// MARK: addLabel
	func addLabel() {
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.bottomAnchor.constraint(equalTo: imageLogo.topAnchor, constant: -30).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
		titleLabel.textAlignment = .center
		titleLabel.text = NSLocalizedString("title.title", comment: "Сбербанк")
		titleLabel.font = UIFont.bold38
		titleLabel.textColor = #colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1)
	}
	
	// MARK: - addButton
	func addButton() {
		view.addSubview(openButton)
		openButton.translatesAutoresizingMaskIntoConstraints = false
		openButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
		openButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
		openButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
		openButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
		openButton.roundedButtonYellow(cornerRadius: 10)
		openButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		openButton.setTitleColor(#colorLiteral(red: 0.09711175412, green: 0.626296401, blue: 0.1582792997, alpha: 1), for: .normal)
		openButton.setTitle(NSLocalizedString("button.authorizationEnter", comment: "ВОЙТИ"), for: .normal)
		openButton.titleLabel?.font = UIFont.semibold15
		
	}
}
