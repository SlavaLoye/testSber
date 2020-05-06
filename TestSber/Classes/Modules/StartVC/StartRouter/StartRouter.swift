//
//  StartRouter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//


import UIKit

class StartRouter {
	
	// MARK: - privet
	private let rootViewController: UIViewController?
	private let nextViewController: UIViewController?
	
	
	// MARK: - init
	init(rootViewController: UIViewController?,
		 nextViewController: UIViewController?) {
		self.rootViewController = rootViewController
		self.nextViewController = nextViewController
		self.rootViewController?.modalPresentationStyle = .fullScreen
		self.nextViewController?.modalPresentationStyle = .fullScreen
	}
	
	// MARK: - root
	func root(_ window: inout UIWindow?) {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = rootViewController
		(UIApplication.shared.delegate as? AppDelegate)?.startRSSNews()
	}
	
	// MARK: - openNextViewController
	func openNextViewController() {
		guard let rootViewController = self.rootViewController,
			let nextViewController = self.nextViewController else {
				return
		}
		
		rootViewController.present(nextViewController, animated: true, completion: nil)
	}
}

