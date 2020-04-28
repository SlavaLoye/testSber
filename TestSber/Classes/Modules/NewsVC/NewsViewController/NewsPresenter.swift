//
//  NewsPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsPresenter: NSObject, NewsViewOutConnection, UICollectionViewDelegate, UICollectionViewDataSource {
	
	//private var rssItems = [RSSItem]()
	
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
		interactor?.parseFeed(url: TemplateURL.finamRU.rawValue, completionHandler: { (rssItems) in
			interactor?.rssItems = rssItems
		})
	}
	
	// MARK: - delegating
	private func delegating()  {
		view?.collectionView?.delegate = self
		view?.collectionView?.dataSource = self
	}
	
	// MARK: - UICollectionViewDataSource
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return models.count
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		let modelCell = models[section]
		switch modelCell {
			case .news:
				return  interactor?.rssItems.count ?? 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let modelCell = models[indexPath.section]
		
		switch modelCell {
			case .news:
				if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell {
					let title = rssItems[indexPath.row]
					cell.configureCell(title: title.pubDate)
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
