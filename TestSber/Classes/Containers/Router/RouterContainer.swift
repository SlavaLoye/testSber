//
//  RouterContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class RouterContainer: Containerable {
	
	let container: Container
	var controller: ContainerController?
	
	required init(container: Container) {
		self.container = container
	}
	
	//MARK: - fetchSubcontainer
	func fetchSubcontainer<T: Containerable>() -> T? {
		return controller?.fetchSubcontainer()
	}
	
	//MARK: - register
	func register() {
		container.register(SberRouter.self) { (resolver) -> SberRouter in
			return SberRouter(pullableService: PullableService(container: self))
		}
	}
}
