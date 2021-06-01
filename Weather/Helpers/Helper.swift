//
//  Helper.swift
//  Weather
//
//  Created by FGT MAC on 5/30/21.
//

import UIKit

extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}


extension URLSession: NetworkLoader{
    func loadData(from url: URLRequest, completion: @escaping (Data?, Error?) -> ()) {
        dataTask(with: url) { (data, _,error) in
            completion(data,error)
        }.resume()
    }
}
