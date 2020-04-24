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

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
	
	private func registerDependencies() {
	  // НАДО ЗАРЕГИСТРИРОВАТЬ КОНТЕЙНЕР!
	  containersController.setup(&mainContainer, on: container)
	}
	
	private func rootViewController() {
	   let startRouter = mainContainer?.get(StartRouter.self)
	   startRouter?.root(&window)
	 }

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

