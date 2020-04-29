//
//  DetailNewsContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class DetailNewsContainer: Containerable {
	
	let container: Container
	var controller: ContainerController?
	
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		
		//MARK: - SaveNewsViewController
		container.register(DetailNewsViewController.self) { (resolver) -> DetailNewsViewController in
			let vc = DetailNewsViewController()
			vc.presenter = resolver.resolve(DetailNewsViewOutConnection.self)
			return vc
		}.implements(DetailNewsViewInConnection.self)
				
		// MARK: - SaveNewsPresenter
		container.register(DetailNewsPresenter.self) { (resolver) -> DetailNewsPresenter in
			let presenter = DetailNewsPresenter()
			presenter.interactor = resolver.resolve(DetailNewsPresenterOutConnection.self)
			return presenter
		}.initCompleted { (resolver, presenter) in
			presenter.view = self.resolve()!
		}.implements(DetailNewsViewOutConnection.self)
				
		// MARK: - SaveNewsInteractor
		container.register(DetailNewsInteractor.self) { (resolver) -> DetailNewsInteractor in
			let interactor = DetailNewsInteractor()
			return interactor
		}.implements(DetailNewsPresenterOutConnection.self)
	}
}

