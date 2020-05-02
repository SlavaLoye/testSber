//
//  RecentlyViewedDataProviderRSSItemContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 02.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation
import Swinject

class RecentlyViewedDataProviderRSSItemContainer: Containerable {
	var controller: ContainerController?
	var container: Container
	
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		container.register(RecentlyViewedRSSService.self) { (resolver) -> RecentlyViewedRSSService in
			let service = RecentlyViewedDataProviderImplemintation(realmService: self.resolve()!)
			return service
		}.inObjectScope(.container)
	}
	
}
