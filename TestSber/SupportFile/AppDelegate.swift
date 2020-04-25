//
//  AppDelegate.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 Viacheslav Loie. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	private let container = Container()
	private lazy var mainContainer: MainContainer? = nil
	private let containersController = ContainerController()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		registerDependencies()
		rootViewController()
		return true
	}
	
	private func registerDependencies() {
		// НАДО ЗАРЕГИСТРИРОВАТЬ КОНТЕЙНЕР!
		containersController.setup(&mainContainer, on: container)
	}
	
	private func rootViewController() {
		// StartRouter
		let startRouter = mainContainer?.get(StartRouter.self)
		startRouter?.root(&window)
	}
	
	private func startObservingCartCount() {
//    let dataProviderService: CartDataProviderService? = mainContainer?.resolve()
//    let startContainer: StartContainer? = mainContainer?.subContainers.first(where: { (container) -> Bool in
//      return container is StartContainer
//    }) as? StartContainer
//
//    dataProviderService?.countChanged = { count in
//      let tabBarController = startContainer?.nextViewController as? UITabBarController
//      if count == 0 {
//        tabBarController?.tabBar.items?[2].badgeValue = nil
//      } else {
//        tabBarController?.tabBar.items?[2].badgeValue = "\(count)"
//		}
//      }
   }
}

