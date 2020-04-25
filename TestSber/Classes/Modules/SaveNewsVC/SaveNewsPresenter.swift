//
//  SaveNewsPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class SaveNewsPresenter: NSObject, SaveNewsViewOutConnection {
	
	// MARK: - view
	weak var view: SaveNewsViewInConnection?
	
	// MARK: - interactor
	var interactor: SaveNewsPresenterOutConnection?
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		
	}
}
