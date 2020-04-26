//
//  Extension+UICollectionView.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//


import UIKit

extension UICollectionView {
	
	// MARK: - getCell
	func getCell<T: NibLoadable & UICollectionViewCell>(for indexPath: IndexPath) -> T {
		return dequeueReusableCell(withReuseIdentifier: T.name, for: indexPath) as! T
	}
	
	// MARK: - getCell
	func registerCells(types: [NibLoadable.Type]) {
		for type in types {
			self.register(type.nib, forCellWithReuseIdentifier: type.name)
		}
	}
	
	// MARK: - register
	func register(_ names: [String]) {
		names.forEach { name in
			register(UINib.init(nibName: name, bundle: Bundle.main), forCellWithReuseIdentifier: name)
		}
	}
	
}
	// MARK: - reloadCellDataWithoutAnimation
extension UICollectionView {
	func reloadCellDataWithoutAnimation() {
		let collectionView = self
		UIView.setAnimationsEnabled(false)
		collectionView.performBatchUpdates({})
		collectionView.reloadItems(at:(0..<collectionView.numberOfItems(inSection: 0)).map {IndexPath.init(row: $0, section: 0)})
		UIView.setAnimationsEnabled(true)
	}
}


