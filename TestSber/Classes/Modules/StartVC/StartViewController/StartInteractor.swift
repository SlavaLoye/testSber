//
//  StartInteractor.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation


class StartInteractor: StartPresenterOutConnection {
	
  // MARK: - presenter
  weak var presenter: StartPresenter!
  
  // MARK: - selectButtonClicked
  func selectButtonClicked() {
    presenter.openNextViewController()
  }
}
