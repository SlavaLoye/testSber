//
//  DetailNewsPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class DetailNewsPresenter: NSObject, DetailNewsViewOutConnection, UITableViewDataSource, UITableViewDelegate {
	
	// MARK: - view
	weak var view: DetailNewsViewInConnection?
	
	// MARK: - interactor
	var interactor: DetailNewsPresenterOutConnection?
	
	// MARK: - collectiomView
	private var tableView: UITableView? {
		return view?.tableView
	}
	
	
	// MARK: - models
	private let models: [CellModel] = [.title, .newsTitle, .timer, .descriptionNews]
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		delegating() 
	}
	
	// MARK: - viewWillAppear
	func viewWillAppear() {
	}
	
	// MARK: - delegating
	func delegating()  {
		view?.tableView.delegate = self
		view?.tableView.dataSource = self
	}
	
	// MARK: - UITableViewDataSource
	func numberOfSections(in tableView: UITableView) -> Int {
		return models.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let modelCell = models[section]
		
		switch modelCell {
			case .title:
				return 1
			case .newsTitle:
				return 1
			case .timer:
				return 1
			case .descriptionNews:
				return 1
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let modelCell = models[indexPath.section]
		
		switch modelCell {
			
			case .title:
				if let titleCell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as? TitleTableViewCell {
					titleCell.selectionStyle = .none
					titleCell.configureCell(header: NSLocalizedString("title.newsTitle", comment: "Новости рынка"))
					titleCell.closeButtonClicked = { [weak self] in
						self?.view?.dissMiss()
					}
					return titleCell
			}
			
			case .newsTitle:
				if let titleCell = tableView.dequeueReusableCell(withIdentifier: "NewsTitleTableViewCell", for: indexPath) as? NewsTitleTableViewCell {
					if let titleNews = interactor?.rss {
						titleCell.configureCell(header: titleNews.title)
					}
					titleCell.selectionStyle = .none
					return titleCell
			}
			
			case .timer:
						if let timerCell = tableView.dequeueReusableCell(withIdentifier: "TimerTableViewCell", for: indexPath) as? TimerTableViewCell {
							timerCell.selectionStyle = .none
							if let timer = interactor?.rss {
								timerCell.configureCell(timer: timer.pubDate, isImages: true)
							}
							return timerCell
					}
			
			case .descriptionNews:
				if let descriptionNewsCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell {
					descriptionNewsCell.selectionStyle = .none
					if let news = interactor?.rss {
						descriptionNewsCell.configureCell(news: news.description)
					}
					return descriptionNewsCell
			}
			
		}
		return UITableViewCell()
	}
	
	// MARK: - UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let modelCell = models[indexPath.section]
		switch modelCell {
			case .title:
				return 44
			case .newsTitle:
				return UITableView.automaticDimension
			case .timer:
				return 44
			case .descriptionNews:
				return UITableView.automaticDimension
		}
	}
}

// MARK: - CellModel
extension DetailNewsPresenter {
	fileprivate enum CellModel {
		case title
		case newsTitle
		case timer
		case descriptionNews
	}
}


