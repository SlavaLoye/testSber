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
    let startViewController: NewsViewController = container.resolve()!
	let tabBarController = UITabBarController()
	tabBarController.tabBar.backgroundColor = UIColor.green
	tabBarController.tabBar.isTranslucent = false
	///
	tabBarController.tabBar.layer.shadowColor = UIColor.black.cgColor
	tabBarController.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
	tabBarController.tabBar.layer.shadowRadius = 5
	tabBarController.tabBar.layer.shadowOpacity = 0.1
	tabBarController.tabBar.layer.masksToBounds = false
    let viewControllers = [startViewController].map {
      UINavigationController.init(rootViewController: $0)
    }
    tabBarController.setViewControllers(viewControllers, animated: true)
    return tabBarController
  }
}
