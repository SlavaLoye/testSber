//
//  NetworkServicesContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 28.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class NetworkServicesContainer: Containerable {
	
	var controller: ContainerController?
	let container: Container
	
	required init(container: Container) {
		self.container = container
	}

	func register() {
		container.register(XMLParserService.self) { (resolver) -> XMLParserService in
			let service = XMLParserServiceImplementation()
			return service
		}
	}
}


