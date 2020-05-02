//
//  Extension+UIImageView.swift
//  TestSber
//
//  Created by Viacheslav Loie on 01.05.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import UIKit

extension UIImageView {
	
public func imageFromServerURL(urlString: String) {
    self.image = nil
    let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
    URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in

        if error != nil {
            print(error as Any)
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            self.image = image
        })

    }).resume()
}}

