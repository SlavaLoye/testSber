//
//  Containerable.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Swinject

protocol Containerable: class {
	
  var container: Container { get }
  init(container: Container)
  func register()
  func get<T>(_ type: T.Type) -> T?
  var controller: ContainerController? { get set }
}

//MARK: -  Arguments
extension Containerable {
  func get<T>(_ type: T.Type) -> T? {
    return container.resolve(type)
  }
  
  func get<T, Arg1>(_ type: T.Type, argument: Arg1) -> T? {
    return container.resolve(type, argument: argument)
  }
  
  func resolve<T>() -> T? {
    return container.resolve(T.self)
  }
  
  func resolve<T, Arg1>(argument: Arg1) -> T? {
    return container.resolve(T.self, argument: argument)
  }
  
  // NEW RESOLVE
  func resolve<T, Arg1, Arg2>(argument: Arg1, argument2: Arg2) -> T? {
    return container.resolve(T.self, arguments: argument, argument2)
  }
}

