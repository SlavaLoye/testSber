//
//  NewsViewInConnection.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

protocol NewsViewInConnection where Self: UIViewController {
	var collectionView: UICollectionView! { get }
	func reloadData()
	func hideLoader()
	func showLoader()
}
