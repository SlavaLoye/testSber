//
//  NewsPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsPresenter: NSObject, NewsViewOutConnection, UICollectionViewDelegate, UICollectionViewDataSource {
	
	// MARK: - view
	weak var view: NewsViewInConnection?
	
	// MARK: - interactor
	var interactor: NewsPresenterOutConnection?
	
	// MARK: - collectiomView
	private var collectiomView: UICollectionView? {
		return view?.collectionView
	}
	
	// MARK: CellModel - realisation
	private let models: [CellModel] = [.news]
	
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		delegating()
	}
	
	// MARK: - delegating
	private func delegating()  {
		view?.collectionView?.delegate = self
		view?.collectionView?.dataSource = self
	}
	
	// MARK: - UICollectionViewDataSource
	
	//	func numberOfSections(in collectionView: UICollectionView) -> Int {
	//		return models.count
	//	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 30
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let modelCell = models[indexPath.section]
		
		switch modelCell {
			case .news:
				if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell {
					cell.backgroundColor =  #colorLiteral(red: 0.09620393068, green: 0.5219721198, blue: 0.1340354979, alpha: 1)
					return cell
				}
				return UICollectionViewCell()
			}
		}
	}
	
	// MARK: - CellModel
	extension NewsPresenter  {
		fileprivate enum CellModel {
			case news
		}
}
