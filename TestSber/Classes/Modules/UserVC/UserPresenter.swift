//
//  UserPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class UserPresenter: NSObject, UserViewOutConnection {
	
	// MARK: - view
	weak var view: UserViewInConnection?
	
	// MARK: router
	
	var router: SberRouter?
	
	// MARK: - interactor
	var interactor: UserPresenterOutConnection?
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		
	}
	
	func selectedVC() {
		router?.route(to: .newsViewController, in: view as? UIViewController)
	}
}


