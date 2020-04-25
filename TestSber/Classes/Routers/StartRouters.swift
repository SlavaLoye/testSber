//
//  StartRouter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import PanModal

class StartRouters {
	class Resolver<T> {
		private(set) var resolvingClosure: ItemClosure<T>?
		
		func resolveProperties(_ closure: @escaping ItemClosure<T>) {
			self.resolvingClosure = closure
		}
	}
	//MARK: typealias RouterType
	typealias RouterType = StartRouterPullableServiceType
	private var pullableService: PullableService<UIViewController>?
	private var resolver: Any? // static typing prohibits to use own Resolver<T> class here, we have to cast
	init(pullableService: PullableService<UIViewController>) {
		self.pullableService = pullableService
	}
	
	//MARK: embedResolving
	func embedResolving<T>(_ closure: @escaping ItemClosure<T>) {
		let resolver = Resolver<T>()
		resolver.resolveProperties(closure)
		self.resolver = resolver
	}
	
	//MARK: route
	func route(to type: RouterType, in sourceViewController: UIViewController?) {
		switch type {
			
			//MARK: HomeUserViewController
			case .startViewController:
				if let vc: UIViewController = pullableService?.container?.get(StartViewController.self) {
					let nc = UINavigationController(rootViewController: vc)
					nc.modalPresentationStyle = .fullScreen
					sourceViewController?.present(nc, animated: true, completion: nil)
			}
			case .newsViewController:
			if let vc: UIViewController? = pullableService?.container?.get(NewsViewController.self) {
			  sourceViewController?.navigationController?.pushViewController(vc!, animated: true)
			}
		}
	}
}
