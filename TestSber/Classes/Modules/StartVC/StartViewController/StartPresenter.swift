//
//  StartPresenter.swift
//  TestSber
//
//  Created by Viacheslav Loie on 24.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

class StartPresenter: NSObject, StartViewOutConnection {
  
  private let router: StartRouter
  private let interactor: StartInteractor
  
  init(router: StartRouter,
       interactor: StartInteractor) {
    self.router = router
    self.interactor = interactor
  }
  
  func selectButtonClicked() {
    interactor.selectButtonClicked()
  }
  
  func openNextViewController() {
    router.openNextViewController()
  }
}
