//
//  PullableService.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

protocol ViewControllerContainerable {
  
}

class PullableService<T> {
  weak var container: RouterContainer?
  
  required init(container: RouterContainer) {
    self.container = container
  }
  
  func pull(by type: T.Type) -> UIViewController? {
    return container?.get(type) as? UIViewController
  }
  
  func pull<Arg1>(by type: T.Type, argument: Arg1) -> UIViewController? {
    return container?.get(type, argument: argument) as? UIViewController
  }
}


