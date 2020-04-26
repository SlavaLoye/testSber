//
//  NewsViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewInConnection {
	
	// MARK: - presenter
	var presenter: NewsViewOutConnection?
	var collectionView: UICollectionView! = nil
	
	// MARK: - viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
		presenter?.viewDidLoad()
		view.backgroundColor = .white
		
	}
	
	// MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavBar()
	}

	
	// MARK: - init
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "homeinactive"), tag: 0)
		tabBarItem.image = UIImage(named: "homeinactive")?.withRenderingMode(.alwaysOriginal)
		tabBarItem.selectedImage = UIImage(named: "homeinactive")?.withRenderingMode(.alwaysOriginal)
		// make unselected icons white
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - setupNavBar()
extension NewsViewController {
	private func setupNavBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		title = "Главная"
		navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.semibold20, NSAttributedString.Key.foregroundColor: UIColor.sberGreen]
	}
}

// MARK: - setupCollectionView()
extension NewsViewController {
	private func setupCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		collectionView.backgroundColor = .white
		registerCells()
		view.addSubview(collectionView)
	}
}

// MARK: - Setup Layout
extension NewsViewController {
	// Работает только с IOS 13 (new fitcha)
	private func createLayout() -> UICollectionViewLayout {
		// section -> groups -> items -> size
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
											  heightDimension: .fractionalHeight(1.0))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
											   heightDimension: .fractionalWidth(0.5))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
		let spacing = CGFloat(2)
		group.interItemSpacing = .fixed(spacing)
		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = spacing
		section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
		let layout = UICollectionViewCompositionalLayout(section: section)
		return layout
	}
}

// MARK: - registerCells()
extension NewsViewController {
	private func registerCells()  {
		collectionView?.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.reuseId)
	}
}
