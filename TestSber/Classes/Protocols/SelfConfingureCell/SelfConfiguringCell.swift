//
//  SelfConfiguringCell.swift
//  TestSber
//
//  Created by Viacheslav Loie on 26.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with intValue: Int)
}
