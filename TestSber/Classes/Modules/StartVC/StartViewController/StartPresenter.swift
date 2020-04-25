//
//  StartPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class StartPresenter: NSObject, StartViewOutConnection {
	
	// MARK: - router
	private let router: StartRouter?
	//var startRouter: StartRouters?
	
	// MARK: - interactor
	private let interactor: StartPresenterOutConnection?
	
	// MARK: - view
	weak var view: StartViewInConnection?

	// MARK: - init
	init(router: StartRouter, interactor: StartPresenterOutConnection) {
		self.router = router
		self.interactor = interactor
	}
	
	func viewDidLoad() {
		
	}

	// MARK: - selectButtonClicked
	func selectButtonClicked() {
		//startRouter?.route(to: .newsViewController, in: view)
		interactor?.selectButtonClicked()
	}
	
	// MARK: - openNextViewController
	func openNextViewController() {
		router?.openNextViewController()
	}
}
