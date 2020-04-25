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
	  tabBarItem = UITabBarItem(title: "Новости", image: UIImage(named: "listbtn"), tag: 1)
	  tabBarItem.image = UIImage(named: "listbtn")?.withRenderingMode(.alwaysOriginal)
	  tabBarItem.selectedImage = UIImage(named: "listbtn")?.withRenderingMode(.alwaysOriginal)
	}
	
	required init?(coder aDecoder: NSCoder) {
	  fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - setupNavBar()
extension SaveNewsViewController {
  func setupNavBar() {
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
}

