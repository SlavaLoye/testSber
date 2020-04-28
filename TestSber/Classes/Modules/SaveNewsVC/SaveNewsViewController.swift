//
//  SaveNewsViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class SaveNewsViewController: UIViewController, SaveNewsViewInConnection {
	
	// MARK: - presenter
	var presenter: SaveNewsViewOutConnection?
	
	// MARK: - collectionView
	var collectionView: UICollectionView! = nil
	
	// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.viewDidLoad()
		view.backgroundColor = .white
    }

	
	// MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavBar()
		addRightBarButtonItem()
	}
	
	
	// MARK: - addRightBarButtonItem(Nav)
	private func addRightBarButtonItem() {
		let barButtonItem = UIBarButtonItem(image: UIImage(named: "CartBig"),
											style: .plain, target: self, action: #selector(backButtonClicked))
		barButtonItem.tintColor = #colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1)
		navigationItem.rightBarButtonItem = barButtonItem
	}
	
	// MARK: - backButtonClicked(Nav)
	@objc private func backButtonClicked() {
		navigationController?.popViewController(animated: true)
	}
	

	// MARK: - init
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
	  super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	  tabBarItem = UITabBarItem(title: "Новости", image: UIImage(systemName: "doc.text.magnifyingglass"), tag: 1)
		tabBarItem.image = UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
		tabBarItem.selectedImage = UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.09803921569, green: 0.6274509804, blue: 0.1568627451, alpha: 1))
	}
	
	required init?(coder aDecoder: NSCoder) {
	  fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - setupCollectionView()
extension SaveNewsViewController {
	private func setupCollectionView() {
		if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
		flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
		}
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		collectionView.backgroundColor = .white
		//registerCells()
		view.addSubview(collectionView)
	}
}

// MARK: - Setup Layout
extension SaveNewsViewController {
	// Работает только с IOS 13 (new fitcha)
	private func createLayout() -> UICollectionViewLayout {
		// section -> groups -> items -> size
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
											  heightDimension: .fractionalHeight(1.0))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
											   heightDimension: .fractionalWidth(0.25))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
		let spacing = CGFloat(10)
		group.interItemSpacing = .fixed(spacing)
		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = spacing
		section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
		let layout = UICollectionViewCompositionalLayout(section: section)
		return layout
	}
}


// MARK: - setupNavBar()
extension SaveNewsViewController {
	private func setupNavBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		title = "Новости"
		navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.semibold20, NSAttributedString.Key.foregroundColor: UIColor.sberGreen]
	}
}
