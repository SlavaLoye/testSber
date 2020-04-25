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
	
}

