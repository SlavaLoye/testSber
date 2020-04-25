//
//  NewsPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsPresenter: NSObject, NewsViewOutConnection {
	
	weak var view: NewsViewInConnection?
	var interactor: NewsPresenterOutConnection?
	
	func viewDidLoad() {
		
	}	
}
