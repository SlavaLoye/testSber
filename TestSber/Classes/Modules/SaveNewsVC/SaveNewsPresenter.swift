//
//  SaveNewsPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class SaveNewsPresenter: NSObject, SaveNewsViewOutConnection, UITableViewDelegate, UITableViewDataSource {
	
	// MARK: - view
	weak var view: SaveNewsViewInConnection?
	
	// MARK: - interactor
	var interactor: SaveNewsPresenterOutConnection?

	private var rssItem: [RSSItem] {
		return interactor?.rssItems ?? []
	  }
	
	
	// MARK: - interactor
	private let models: [CellModel] = [.news]
	
	// MARK: - tableView
	private var tableView: UITableView? {
		return view?.tableView
	}
	
	var pageItemsCount: Int = 10
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		delegating()
		//interactor?.items = []
	}
	
	func viewWillAppear() {
		delegating()
	}
	
	// MARK: - delegating
	func delegating() {
		view?.tableView.delegate = self
		view?.tableView.dataSource = self
	}
//
//	// MARK: - UITableViewDataSource
//	func numberOfSections(in tableView: UITableView) -> Int {
//		return models.count
//	}
//
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		let modelCell = models[section]
//		switch modelCell {
////			case .news:
//				if interactor?.items.count ?? 0 >= pageItemsCount {
//					return interactor?.items.count ?? 0 + 1
//				}
				//return interactor?.items.count ?? 0
		//}
		return  rssItem.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let modelCell = models[indexPath.row]
//		switch modelCell {
//			case .news:
				if let rss = interactor?.recentlyRssService.rssItems.rssList, rss.isEmpty == false {
					if let cell = tableView.dequeueReusableCell(withIdentifier: "SaveNewsTableViewCell", for: indexPath) as? SaveNewsTableViewCell {
						let item = rssItem[indexPath.row]
						cell.configureCell(header: item.title, timer: item.pubDate, news: item.descriptions, isImages: true)
						//cell.rssItems = Array(items.reversed())
						return cell
					}
				}
				return UITableViewCell()
		}
	//}
	
	// MARK: - UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}

extension SaveNewsPresenter {
	fileprivate enum CellModel {
		case news
	}
}
