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
	
	// MARK: StartRouter
	
	
	func register() {
		container.register(StartRouter.self) { (resolver) -> StartRouter in
			let nextViewController = TabBarControllerFactory(container: self, mode: .main).tabBarController()
			self.nextViewController = nextViewController
			let startRouter = StartRouter(rootViewController: self.fetchRootViewController(),
										  nextViewController: nextViewController)
			return startRouter
		}
		// MARK: StartViewController
		container.register(StartViewController.self) { (resolver) -> StartViewController in
			return StartViewController()
		}.initCompleted { (resolver, viewController) in
			viewController.presenter = resolver.resolve(StartPresenter.self)
		}
		
		
		// MARK: - Presenter
		container.register(StartPresenter.self) { (resolver) -> StartPresenter in
			let presenter = StartPresenter(router: resolver.resolve(StartRouter.self)!,
										   interactor: resolver.resolve(StartInteractor.self)!)
			
			return presenter
			
		}// ИЗБЕГАЕМ РЕКУРСИИ
		
		
		// MARK: - Interactor
		container.register(StartInteractor.self) { (r) -> StartInteractor in
			let interactor = StartInteractor()
			return interactor
		}.initCompleted { (r, i) in
			i.presenter = r.resolve(StartPresenter.self)
		}
	}
	// MARK: fetchRootViewController
	
	func fetchRootViewController() -> UIViewController? {
		//    let vc = TabBarControllerFactory(container: self, mode: .main).tabBarController()
		//    return vc
		return get(StartViewController.self)
	}
	
	func fetchRouter() -> StartRouter? {
		return get(StartRouter.self)
	}
}



