//
//  NewsViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewInConnection {
	
	// MARK: - presenter
	var presenter: NewsViewOutConnection?
	
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
		tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "homeinactive"), tag: 0)
		tabBarItem.image = UIImage(named: "homeinactive")?.withRenderingMode(.alwaysOriginal)
		tabBarItem.selectedImage = UIImage(named: "homeinactive")?.withRenderingMode(.alwaysOriginal)
		// make unselected icons white
	  }
	  
	  required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - setupNavBar()
extension NewsViewController {
  func setupNavBar() {
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
}
