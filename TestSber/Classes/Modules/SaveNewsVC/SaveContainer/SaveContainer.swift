//
//  SaveContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class SaveContainer: Containerable {
	
	let container: Container
	var controller: ContainerController?
	
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		
		//MARK: - SaveNewsViewController
		container.register(SaveNewsViewController.self) { (resolver) -> SaveNewsViewController in
			let vc = SaveNewsViewController()
			vc.presenter = resolver.resolve(SaveNewsViewOutConnection.self)
			return vc
		}.implements(SaveNewsViewInConnection.self)
		
		
		// MARK: - SaveNewsPresenter
		container.register(SaveNewsPresenter.self) { (resolver) -> SaveNewsPresenter in
			let presenter = SaveNewsPresenter()
			presenter.interactor = resolver.resolve(SaveNewsPresenterOutConnection.self)
			presenter.sberRouter = self.resolve()!
			return presenter
		}.initCompleted { (resolver, presenter) in
			presenter.view = self.resolve()!
		}.implements(SaveNewsViewOutConnection.self)
		
		
		// MARK: - SaveNewsInteractor
		container.register(SaveNewsInteractor.self) { (resolver) -> SaveNewsInteractor in
			let interactor = SaveNewsInteractor(recentlyRssService: self.resolve()!, xmlDataService: self.resolve()!)
			return interactor
		}.implements(SaveNewsPresenterOutConnection.self)
	}
}

