//
//  MockLoader.swift
//  WeatherTests
//
//  Created by FGT MAC on 5/31/21.
//

import Foundation
@testable import Weather

class MockLoader: NetworkLoader {
    var data: Data?
    var error: Error?
    
    func loadData(from url: URLRequest, completion: @escaping (Data?, Error?) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            completion(self.data,self.error)
        }
        
    }
    
    
}
