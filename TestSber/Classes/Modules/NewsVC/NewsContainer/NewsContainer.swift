//
//  NewsContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class NewsContainer: Containerable {
	
	let container: Container
	var controller: ContainerController?
	
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		
		//MARK: - CitiesViewController
		container.register(NewsViewController.self) { (resolver) -> NewsViewController in
			let vc = NewsViewController()
			vc.presenter = resolver.resolve(NewsViewOutConnection.self)
			return vc
		}.implements(NewsViewInConnection.self)
		
		
		// MARK: - CitiesPresenter
		container.register(NewsPresenter.self) { (resolver) -> NewsPresenter in
			let presenter = NewsPresenter()
			presenter.interactor = resolver.resolve(NewsPresenterOutConnection.self)
			return presenter
		}.initCompleted { (resolver, presenter) in
			presenter.view = self.resolve()!
		}.implements(NewsViewOutConnection.self)
		
		
		// MARK: - CitiesInteractor
		container.register(NewsInteractor.self) { (resolver) -> NewsInteractor in
			let interactor = NewsInteractor(xmlService: self.resolve()!)
			return interactor
		}.implements(NewsPresenterOutConnection.self)
	}
}
