//
//  TabBarControllerFactory.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

// Fabric TabBar
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
  
  // Fabric TabBar
  private func mainTabBarController() -> UIViewController {
    let newsViewController: NewsViewController = container.resolve()!
	let userViewController: UserViewController = container.resolve()!
	let saveNewsViewController: SaveNewsViewController = container.resolve()!
	let tabBarController = UITabBarController()
	tabBarController.tabBar.backgroundColor = UIColor.white
	tabBarController.tabBar.isTranslucent = false
	if #available(iOS 13, *) {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .white

        appearance.stackedLayoutAppearance.normal.iconColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)]

        appearance.stackedLayoutAppearance.selected.iconColor = #colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1)]

        tabBarController.tabBar.standardAppearance = appearance

    }
	tabBarController.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
	tabBarController.tabBar.layer.shadowRadius = 5
	tabBarController.tabBar.layer.shadowOpacity = 0.1
	tabBarController.tabBar.layer.masksToBounds = false
    let viewControllers = [newsViewController, saveNewsViewController, userViewController].map {
      UINavigationController.init(rootViewController: $0)
    }
    tabBarController.setViewControllers(viewControllers, animated: true)
    return tabBarController
  }
}

extension UITabBarController {
	func selectNews() {
		selectedIndex = 0
	}
	
	func selectSaveNews() {
		selectedIndex = 1
	}
	
	func selectUser() {
		selectedIndex = 2
	}
}
