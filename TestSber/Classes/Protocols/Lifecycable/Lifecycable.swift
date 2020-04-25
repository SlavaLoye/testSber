//
//  Lifecycable.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

protocol Lifecycable {
	func viewDidLoad()
	func viewDidAppear()
	func viewWillAppear()
	func viewDidLayoutSubviews()
	func viewWillDisappear()
    func viewDidDisappear()
}

extension Lifecycable {
	func viewDidLoad() {}
	func viewDidAppear() {}
	func viewWillAppear() {}
	func viewDidLayoutSubviews() {}
	func viewWillDisappear() {}
    func viewDidDisappear() {}
}

