//
//  RealmServiceContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 05.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class RealmServiceContainer: Containerable {
	var controller: ContainerController?
	
	let container: Container
	
	required init(container: Container) {
		self.container = container
	}
	
	func register() {
		container.register(RealmService.self) { (resolver) -> RealmService in
			let service = RealmServiceImplementation()
			return service
		}
	}
}
