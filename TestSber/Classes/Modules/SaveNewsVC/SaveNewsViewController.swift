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
	
	// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.viewDidLoad()
		view.backgroundColor = .white
    }
	
	// MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavBar()
	}
	

	// MARK: - init
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
	  super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	  tabBarItem = UITabBarItem(title: "Новости", image: UIImage(systemName: "doc.text.magnifyingglass"), tag: 1)
		tabBarItem.image = UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
		tabBarItem.selectedImage = UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
	}
	
	required init?(coder aDecoder: NSCoder) {
	  fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - setupNavBar()
extension SaveNewsViewController {
	private func setupNavBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		title = "Новости"
		navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.semibold20, NSAttributedString.Key.foregroundColor: UIColor.sberGreen]
	}
}
