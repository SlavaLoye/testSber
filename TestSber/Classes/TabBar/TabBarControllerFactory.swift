//
//  TabBarControllerFactory.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

// Фабрика TabBar

class TabBarControllerFactory {
  enum Mode {
    case main
    case two
  }
  
  private let mode: Mode
  private let container: Containerable
  
  init(container: Containerable, mode: Mode) {
    self.container = container
    self.mode = mode
  }
  
  func tabBarController() -> UIViewController {
    return mainTabBarController()
  }
  
  private func mainTabBarController() -> UIViewController {
    let startViewController: StartViewController = container.resolve()!
    let tabBarController = UITabBarController()
    tabBarController.tabBar.barStyle = .black
    let viewControllers = [startViewController].map {
      UINavigationController.init(rootViewController: $0)
    }
    tabBarController.setViewControllers(viewControllers, animated: true)
    return tabBarController
  }
}
