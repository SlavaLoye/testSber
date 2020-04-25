//
//  NewsViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewInConnection {
	
	var presenter: NewsViewOutConnection?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.viewDidLoad()
		view.backgroundColor = .white
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavBar()
	}
	
	  // MARK: - init
	  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		tabBarItem = UITabBarItem(title: "", image: UIImage(named: "money"), tag: 0)
		tabBarItem.image = UIImage(named: "money")?.withRenderingMode(.alwaysOriginal)
		tabBarItem.selectedImage = UIImage(named: "money")?.withRenderingMode(.alwaysOriginal)
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
