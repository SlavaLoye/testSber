//
//  ContainerController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation
import Swinject

class ContainerController {
	private var mainContainer: MainContainer?
	
	// MARK: container
	let containerTypes: [Containerable.Type] = [
		DataProvidersContainer.self,
		NetworkServicesContainer.self,
		StartContainer.self,
		RouterContainer.self,
		NewsContainer.self,
		UserContainer.self,
		SaveContainer.self,
		DetailNewsContainer.self
	]
	
	// MARK: fetchSubcontainer
	func fetchSubcontainer<T: Containerable>() -> T? {
		return mainContainer?.fetchSubcontainer()
	}
	
	// MARK: setup
	func setup(_ mainContainer: inout MainContainer?, on container: Container) {
		var containers: [Containerable] = []
		for type in containerTypes {
			let container = type.init(container: container)
			container.controller = self
			containers.append(container)
		}
		mainContainer = MainContainer(container: container, subContainers: containers)
		mainContainer?.register()
		self.mainContainer = mainContainer
	}
}


