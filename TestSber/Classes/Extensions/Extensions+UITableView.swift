//
//  Extensions+UITableView.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

extension UITableView {
  func reloadDataWithoutAnimation() {
    let tableView = self
    UIView.setAnimationsEnabled(false)
    tableView.beginUpdates()
    tableView.reloadRows(at: (0..<tableView.numberOfRows(inSection: 0)).map {IndexPath.init(row: $0, section: 0)}, with: .automatic)
    tableView.endUpdates()
    UIView.setAnimationsEnabled(true)
  }
}


// MARK: - getCell - registaration Cells
extension UITableView {
    
  func getCell<T: NibLoadable & UITableViewCell>(for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: T.name, for: indexPath) as! T
  }
  
  func registerCells(types: [NibLoadable.Type]) {
    for type in types {
      self.register(type.nib, forCellReuseIdentifier: type.name)
    }
  }
}


