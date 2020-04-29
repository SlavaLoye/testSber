//
//  DetailNewsViewController.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit
import PanModal

class DetailNewsViewController: UIViewController, DetailNewsViewInConnection, PanModalPresentable {

	// MARK: - tableView
	var tableView: UITableView = UITableView()
	
	// MARK: - presenter
	var presenter: DetailNewsViewOutConnection?
	
	// MARK: - safeArea
	var safeArea: UILayoutGuide!
	
	// MARK: - presenter
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoad()
		setupTableView()
		registerCells()
		safeArea = view.layoutMarginsGuide
//		tableView.estimatedRowHeight = 155.0
		tableView.rowHeight = UITableView.automaticDimension
		tableView.separatorStyle = .none
		view.backgroundColor = .white
	}
	
	// MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		presenter?.viewWillAppear()
		setupNavBar()
	}
	
	// MARK: - dissmis
	
	func dissMiss()  {
		dismiss(animated: true, completion: nil)
	}
	
	// MARK: - setupTableView
	func setupTableView() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		view.backgroundColor = .white
	}
}

// MARK: - setupNavBar()
extension DetailNewsViewController {
	private func setupNavBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		title = "Новости партнеров"
		navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.semibold20, NSAttributedString.Key.foregroundColor: UIColor.sberGreen]
	}
}


// MARK: - PanModal
extension DetailNewsViewController {
    
    var panScrollable: UIScrollView? {
        return tableView
    }
    
    var cornerRadius: CGFloat {
        return 20
    }
    
    var allowsTapToDismiss: Bool {
        return true
    }
    
    var allowsDragToDismiss: Bool {
        return true
    }
    
    var shortFormHeight: PanModalHeight {
		return .contentHeight(view.frame.height)
    }
    
    var longFormHeight: PanModalHeight {
        return shortFormHeight
    }
}

// MARK: - decorate
extension DetailNewsViewController {
	func decorate() {
		//closedButton.roundedButton(cornerRadius: 10)
	}
}

extension DetailNewsViewController {
	func registerCells()  {
		tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseId)
		tableView.register(TimerTableViewCell.self, forCellReuseIdentifier: TimerTableViewCell.reuseId)
		tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseId)
		tableView.register(NewsTitleTableViewCell.self, forCellReuseIdentifier: NewsTitleTableViewCell.reuseId)
		
	}
}
