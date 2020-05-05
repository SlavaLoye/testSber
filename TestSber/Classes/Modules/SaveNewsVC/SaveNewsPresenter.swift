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
	
	// MARK: - SberRouter
	var sberRouter: SberRouter?
	
	
	// MARK: - tableView
	private var tableView: UITableView? {
		return view?.tableView
	}
	
	// MARK: - pageItemsCount
	private var pageItemsCount: Int = 10
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		interactor?.rssItems = []
		delegating()
		finamFetch()
	}
	
	// MARK: - viewWillAppear
	func viewWillAppear() {
		notification()
		tableView?.reloadData()
	}
	
	// MARK: - finamFetch
	func finamFetch() {
		//		view?.showLoader()
		interactor?.parseFeed(url: TemplateURL.finamRU.rawValue, completion: { [weak self] ( rssItems) in
			self?.interactor?.rssItems = rssItems
			OperationQueue.main.addOperation {
				self?.view?.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
			}
		})
	}
	
	// MARK: - notification
	func notification()  {
		NotificationCenter.default.addObserver(self, selector: #selector(refreshContentOnRSSChanged(_:)), name: Notification.rssChanged, object: nil)
	}
	
	@objc func refreshContentOnRSSChanged(_ notification: Notification) {
		interactor?.recentlyRssService.clear()
		DispatchQueue.main.async { [weak self] in
			self?.buttonActionRefresh(nil)
		}
	}
	
	@objc func buttonActionRefresh(_ sender: Any?) {
		finamFetch()
		tableView?.reloadData()
	}
	
	// MARK: - delegating
	func delegating() {
		view?.tableView.delegate = self
		view?.tableView.dataSource = self
	}
	
	// MARK: - UITableViewDataSource
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			if interactor?.rssItems.count ?? 0 >= pageItemsCount {
				return interactor?.rssItems.count ?? 0 + 1
			}
		return  interactor?.rssItems.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let rss = interactor?.recentlyRssService.rssItems.rssList, rss.isEmpty == false {
			if let cell = tableView.dequeueReusableCell(withIdentifier: "SaveNewsTableViewCell", for: indexPath) as? SaveNewsTableViewCell {
				cell.selectionStyle = .none
				let item = interactor?.rssItems[indexPath.row]
				cell.configureCell(header: item?.title, timer: item?.pubDate, news: item?.descriptions, isImages: true)
				//cell.rssItems = Array(rssItem.reversed())
				return cell
			}
		}
		return UITableViewCell()
	}
	
	
	// MARK: - UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 300
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let rss = rssItem[indexPath.row]
		sberRouter?.route(to: .detailNewsViewController(rss: rss), in: view)
	}
}

