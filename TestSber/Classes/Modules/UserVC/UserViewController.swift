//
//  UserViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UserViewInConnection {
	
	// MARK: - presenter
	var presenter: UserViewOutConnection?
	
	// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.viewDidLoad()
		view.backgroundColor = .white
    }
	
	// MARK: - viewDidLoad
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavBar()
	}
	
	// MARK: - init
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
	  super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	  tabBarItem = UITabBarItem(title: "Аккаунт", image: UIImage(named: "User"), tag: 2)
	  tabBarItem.image = UIImage(named: "User")?.withRenderingMode(.alwaysOriginal)
	  tabBarItem.selectedImage = UIImage(named: "User")?.withRenderingMode(.alwaysOriginal)
	}
	
	required init?(coder aDecoder: NSCoder) {
	  fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - setupNavBar()
extension UserViewController {
  func setupNavBar() {
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
}

