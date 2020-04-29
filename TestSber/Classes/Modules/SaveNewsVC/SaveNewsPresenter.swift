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
	
	// MARK: - tableView
	private var tableView: UITableView? {
		return view?.tableView
	}
	
	// MARK: - viewDidLoad
	func viewDidLoad() {
		delegating()
	}
	
	func delegating() {
		view?.tableView.delegate = self
		view?.tableView.dataSource = self
	}
	
	// MARK: - UITableViewDataSource
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
}
