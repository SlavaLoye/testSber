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
	
	// MARK: - SberRouter
	var sberRouter: SberRouter?
	
	// MARK: - isAllSelected
	var isAllSelected: Bool = false
	
	// MARK: - collectiomView
	private var collectiomView: UICollectionView? {
		return view?.collectionView
	}
	
	// MARK: CellModel - realisation
	private let models: [CellModel] = [.news]
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		delegating()
		bankiRUFetch()
		finamFetch()
	}
	
	// MARK: - viewWillAppear
	func viewWillAppear() {
		view?.reloadData()
	}
	
	// MARK: - finamFetch
	func finamFetch() {
		isAllSelected = false
		view?.showLoader()
		interactor?.parseFeed(url: TemplateURL.finamRU.rawValue, completion: { [weak self] ( rssItems) in
			self?.interactor?.rssItems = rssItems
			self?.view?.hideLoader()
			self?.view?.collectionView.reloadData()
		})
	}
	
	// MARK: - bankiRUFetch
	func bankiRUFetch() {
		isAllSelected = true
		view?.showLoader()
		interactor?.parseFeed(url: TemplateURL.bankiRU.rawValue, completion: { [weak self] ( rssItems) in
			self?.interactor?.rssItems = rssItems
			self?.view?.hideLoader()
			self?.view?.collectionView.reloadData()
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
				return self.interactor?.rssItems.count ?? 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellModel = models[indexPath.section]
		switch cellModel {
			case .news:
				if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell {
					let title = interactor?.rssItems[indexPath.row]
					cell.configureCell(header: title?.title, timer: title?.pubDate, news: title?.description, isImages: true, isActive: title?.title == interactor?.recentlyRssService.rssItems.title)
					return cell
				}
				return UICollectionViewCell()
		}
	}
	
	// MARK: - UICollectionViewDelegate
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let modelsCell = models[indexPath.section]
		switch modelsCell {
			case .news:
				let rss = interactor?.rssItems[indexPath.row]
				sberRouter?.route(to: .detailNewsViewController(rss: rss), in: view)
		}
	}
}


// MARK: - CellModel
extension NewsPresenter  {
	fileprivate enum CellModel {
		case news
	}
}
