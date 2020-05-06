//
//  DataProvidersContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 29.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//


import UIKit
import Swinject

class DataProvidersContainer: Containerable {
	var controller: ContainerController?
	let container: Container
	
	required init(container: Container) {
		self.container = container
	}

	
	func register() {
		//MARK: RssDataProviderService
		container.register(RssDataProviderService.self) { (resolver) -> RssDataProviderService in
			let service = RssDataProviderServiceImplementation(realmService: self.resolve()!, rssNetworkService: self.resolve()!)
			return service
		}.inObjectScope(.container)
		
		func register() {
			container.register(RecentlyViewedRSSService.self) { (resolver) -> RecentlyViewedRSSService in
				let service = RecentlyViewedDataProviderImplemintation(realmService: self.resolve()!)
				return service
			}.inObjectScope(.container)
		}
	}
}

