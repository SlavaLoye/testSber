//
//  AppDelegate.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 Viacheslav Loie. All rights reserved.
//

import UIKit
import Swinject
import Realm
import RealmSwift

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
		startRSSNews()
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
	
	// загружаем Cached
	func startRSSNews() {
		loadCachedRecentlyViewedProducts()
	}
	
	// MARK: loadCachedRecentlyViewedProducts
	  
	  private func loadCachedRecentlyViewedProducts() {
		let rcecentlyViewedRSSProvider: RecentlyViewedRSSService? = mainContainer?.resolve()
		rcecentlyViewedRSSProvider?.loadCachedList()
	  }
}

