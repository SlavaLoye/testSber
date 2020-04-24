//
//  MainContainer.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import Swinject

class MainContainer: Containerable {
  let container: Container
	var controller: ContainerController?
  private(set) var subContainers: [Containerable] = []
  
  func fetchSubcontainer<T: Containerable>() -> T? {
    return subContainers.first { $0 is T } as? T
  }
  
  required init(container: Container) {
    self.container = container
  }
  
  convenience init(container: Container, subContainers: [Containerable]) {
    self.init(container: container)
    self.subContainers = subContainers
  }
  
  func register() {
    for subContainer in subContainers {
      subContainer.register()
    }
  }
  
  func get<T>(_ type: T.Type) -> T? {
    return container.resolve(type)
  }
}

