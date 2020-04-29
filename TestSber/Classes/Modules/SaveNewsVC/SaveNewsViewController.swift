//
//  SaveNewsViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class SaveNewsViewController: UIViewController, SaveNewsViewInConnection {

	// MARK: - presenter
	var presenter: SaveNewsViewOutConnection?
	
	// MARK: - tableView
	var tableView: UITableView = UITableView()
	
	// MARK: - safeArea
	var safeArea: UILayoutGuide!
	
	// MARK: - viewDidLoad
	override func loadView() {
	  super.loadView()
	  setupTableView()
	}
	
	// MARK: - viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoad()
		registerCells()
		safeArea = view.layoutMarginsGuide
		tableView.estimatedRowHeight = 155.0
		tableView.rowHeight = UITableView.automaticDimension
		tableView.separatorStyle = .none
	}
	
	// MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavBar()
		addRightBarButtonItem()
	}
	
	// MARK: - setupTableView
	func setupTableView() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		view.backgroundColor = .white
	}
	
	
	// MARK: - addRightBarButtonItem(Nav)
	private func addRightBarButtonItem() {
		let barButtonItem = UIBarButtonItem(image: UIImage(named: "CartBig"),
											style: .plain, target: self, action: #selector(backButtonClicked))
		barButtonItem.tintColor = #colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1)
		navigationItem.rightBarButtonItem = barButtonItem
	}
	
	// MARK: - backButtonClicked(Nav)
	@objc private func backButtonClicked() {
		navigationController?.popViewController(animated: true)
	}
	
	
	// MARK: - init
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		tabBarItem = UITabBarItem(title: "Сохраненные новости", image: UIImage(systemName: "doc.text.magnifyingglass"), tag: 1)
		tabBarItem.image = UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
		tabBarItem.selectedImage = UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - setupNavBar()
extension SaveNewsViewController {
	private func setupNavBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		title = "Сохраненные новости"
		navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.semibold20, NSAttributedString.Key.foregroundColor: UIColor.sberGreen]
	}
}

// MARK: - registerCells()
extension SaveNewsViewController {
	private func registerCells()  {
		tableView.register(SaveNewsTableViewCell.self, forCellReuseIdentifier: SaveNewsTableViewCell.reuseId)
	}
}


