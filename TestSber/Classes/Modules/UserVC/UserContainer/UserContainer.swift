//
//  UserContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class UserContainer: Containerable {
	
	let container: Container
	var controller: ContainerController?
	
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		
		//MARK: - UserViewController
		container.register(UserViewController.self) { (resolver) -> UserViewController in
			let vc = UserViewController()
			vc.presenter = resolver.resolve(UserViewOutConnection.self)
			return vc
		}.implements(UserViewInConnection.self)
		
		// MARK: - SaveNewsPresenter
		container.register(UserPresenter.self) { (resolver) -> UserPresenter in
			let presenter = UserPresenter()
			presenter.interactor = resolver.resolve(UserPresenterOutConnection.self)
			return presenter
		}.initCompleted { (resolver, presenter) in
			presenter.view = self.resolve()!
		}.implements(UserViewOutConnection.self)
				
		// MARK: - SaveNewsInteractor
		container.register(UserInteractor.self) { (resolver) -> UserInteractor in
			let interactor = UserInteractor()
			return interactor
		}.implements(UserPresenterOutConnection.self)
	}
}


