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
		container.register(DetailNewsViewController.self) { (resolver, rss: RSSItem?) -> DetailNewsViewController in
			let vc = DetailNewsViewController()
			vc.presenter = resolver.resolve(DetailNewsViewOutConnection.self, argument: rss)
			return vc
		}.implements(DetailNewsViewInConnection.self)
				
		// MARK: - SaveNewsPresenter
		container.register(DetailNewsPresenter.self) { (resolver, rss: RSSItem?) -> DetailNewsPresenter in
			let presenter = DetailNewsPresenter()
			presenter.interactor = resolver.resolve(DetailNewsPresenterOutConnection.self, argument: rss)
			return presenter
		}.initCompleted { (resolver, presenter) in
			presenter.view = resolver.resolve(DetailNewsViewInConnection.self, argument: presenter.interactor?.rss)
		}.implements(DetailNewsViewOutConnection.self)
				
		// MARK: - SaveNewsInteractor
		container.register(DetailNewsInteractor.self) { (resolver, rss: RSSItem?) -> DetailNewsInteractor in
			let interactor = DetailNewsInteractor()
			interactor.rss = rss
			return interactor
		}.implements(DetailNewsPresenterOutConnection.self)
	}
}

