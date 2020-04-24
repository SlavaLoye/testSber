//
//  StartViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
	
	var presenter: StartPresenter?
	
	convenience init(presenter: StartPresenter?) {
	  self.init()
	  self.presenter = presenter
	}
	open override func loadView() {
        super.loadView()

    }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .red

    }
}
