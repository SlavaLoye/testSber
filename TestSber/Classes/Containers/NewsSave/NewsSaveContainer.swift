//
//  NewsSaveContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 06.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Swinject

class NewsSaveContainer: Containerable {
	
	var controller: ContainerController?
	var container: Container
	
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		container.register(NewsSaveDataProviderService.self) { (resolver) -> NewsSaveDataProviderService in
			let service = NewsSaveDataProviderServiceImplemintation(realmService: self.resolve()!)
			return service
		}.inObjectScope(.container)
	}
}

