//
//  StartContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class StartContainer: Containerable {
	
	let container: Container
	var controller: ContainerController?
	
	var nextViewController: UIViewController!
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		container.register(StartRouter.self) { (resolver) -> StartRouter in
			let nextViewController = TabBarControllerFactory(container: self, mode: .main).tabBarController()
			self.nextViewController = nextViewController
			let startRouter = StartRouter(rootViewController: self.fetchRootViewController(),
										  nextViewController: nextViewController)
			return startRouter
		}
		
		container.register(StartInteractor.self) { (r) -> StartInteractor in
			let interactor = StartInteractor()
			return interactor
		}.initCompleted { (r, i) in
			i.presenter = r.resolve(StartPresenter.self)
		}
		
		container.register(StartPresenter.self) { (resolver) -> StartPresenter in
			let presenter = StartPresenter(router: resolver.resolve(StartRouter.self)!,
										   interactor: resolver.resolve(StartInteractor.self)!)
		return presenter
		}
		
		container.register(StartViewController.self) { (resolver) -> StartViewController in
			return StartViewController()
		}.initCompleted { (resolver, viewController) in
			viewController.presenter = resolver.resolve(StartPresenter.self)
		}
	}
	
	func fetchRootViewController() -> UIViewController? {
		if let vc = get(StartViewController.self) {
			return vc
		} else {
			return nil
		}
	}
	
	func fetchRouter() -> StartRouter? {
		return get(StartRouter.self)
	}
}
