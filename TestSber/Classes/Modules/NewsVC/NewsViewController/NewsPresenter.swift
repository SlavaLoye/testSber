//
//  NewsPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 25.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class NewsPresenter: NSObject, NewsViewOutConnection, UICollectionViewDelegate, UICollectionViewDataSource {
	
	let randomTexts = ["Aenean dapibus urna a ullamcorper malesuada. Ut tempor.",
					   "Sed venenatis ligula massa, a vulputate ipsum fringilla eget. Ut justo erat, facilisis id rhoncus cursus, fringilla at.",
					   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis nibh metus, elementum tempus libero ornare vitae. Etiam sed leo pretium, consectetur turpis non, dapibus purus. Suspendisse potenti. Ut ut eros nunc. Cras nulla justo, porttitor non sapien at, iaculis.",
					   "Maecenas pellentesque sed magna in congue. Sed non lacus in mi posuere scelerisque. Aenean.",
					   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus."]
	
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
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return models.count
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		let modelCell = models[section]
		switch modelCell {
			case .news:
				return  randomTexts.count
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let modelCell = models[indexPath.section]
		
		switch modelCell {
			case .news:
				if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell {
					let title = randomTexts[indexPath.row] 
					cell.configureCell(title: title)
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
