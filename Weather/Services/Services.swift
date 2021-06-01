//
//  Services.swift
//  Weather
//
//  Created by FGT MAC on 5/29/21.
//

import Foundation

protocol NetworkLoader {
    func loadData(from url: URLRequest, completion: @escaping (Data?, Error?)-> ())
}

enum HTTPMethod: String {
    case get = "GET"
}

class Service: NSObject {
    
    private let loader: NetworkLoader
    
    init(loader: NetworkLoader){
        self.loader = loader
    }
    
    func fetchWeather(for city: String, completion: @escaping (Weather?, Error?) -> ()) {
        let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/forecast")!//?q={city}&appid={api key}
        let appID = "65d00499677e59496ca2f318eb68c049"
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let queryItem1 = URLQueryItem(name: "q", value: city)
        let queryItem2 = URLQueryItem(name: "units", value: "imperial")
        let queryItem3 = URLQueryItem(name: "appid", value: appID)
        
        urlComponents?.queryItems = [queryItem1,queryItem2,queryItem3]
        
        guard let requestURL = urlComponents?.url else {
            print("Error in urlComponents")
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        
        loader.loadData(from: request) { data, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                
                DispatchQueue.main.async {
                    completion(weather, nil)
                }
                
            }catch{
                completion(nil,error)
            }
        }
        
    }
}
