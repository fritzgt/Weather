//
//  WeatherModel.swift
//  Weather
//
//  Created by FGT MAC on 5/29/21.
//

import Foundation


struct Weather: Codable {
    var list: [Results]
}

struct Results: Codable {
    var main: Main
    var weather: [WeatherDetails]
}

struct Main: Codable {
    var temp: Double
    var feels_like: Double
}


struct WeatherDetails: Codable {
    var main: String
    var description: String
}
