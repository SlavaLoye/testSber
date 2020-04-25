//
//  NewsViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewInConnection{
	
	var presenter: NewsViewOutConnection?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.viewDidLoad()
		
    }
}

