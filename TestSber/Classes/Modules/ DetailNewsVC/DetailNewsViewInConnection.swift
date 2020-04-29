//
//  DetailNewsViewInConnection.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

protocol DetailNewsViewInConnection where Self: UIViewController {
	var tableView: UITableView { get }
	func dissMiss()
}
