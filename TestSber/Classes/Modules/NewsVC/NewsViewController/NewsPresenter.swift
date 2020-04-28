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
		interactor?.parseFeed(url: TemplateURL.finamRU.rawValue, completionHandler: { [weak self] ( rssItems) in
			self?.interactor?.rssItems = rssItems
			OperationQueue.main.addOperation {
				self?.view?.collectionView.reloadSections(IndexSet(integer: 0))
            }
		})
	}
	
	// MARK: - viewDidLoad
	func viewWillAppear() {
		delegating()
		view?.reloadData()
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
				return self.interactor?.rssItems.count ?? 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellModel = models[indexPath.section]
		switch cellModel {
			case .news:
				if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell {
					let title = interactor?.rssItems[indexPath.row]
					cell.configureCell(header: title?.title, timer: title?.pubDate, news: title?.description)
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
