//
//  SearchViewModel.swift
//  Weather
//
//  Created by FGT MAC on 5/29/21.
//

import Foundation

protocol WeatherDelegate {
    func isDataSet()
}


class SearchViewModel: ObservableObject {
    
    //MARK: - Properties
    private var viewModel = Service(loader: URLSession.shared)
    var delegate: WeatherDelegate?
    
    
    @Published var weatherData: [Results] = [Results]()
    @Published var weatherCount: Int = 0
    @Published var temperature: String = ""
    @Published var feelsLike: String = ""
    @Published var condition: String = ""
    @Published var conditionDetails: String = ""
    
    
    
    //MARK: - Methods
    func fetchWeather(for city: String) {
        viewModel.fetchWeather(for: city) { weather, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let weather = weather{
                self.weatherData = weather.list
                self.weatherCount = weather.list.count
            }
            self.delegate?.isDataSet()
        }
    }
    
    func getTableViewData(for index: Int) -> (temp: String, condition: String) {
    
        let data = weatherData[index]
    
        let temperature = "Temp: \(Int(data.main.temp))"
        let condition = data.weather[0].main
        return (temp: temperature, condition: condition)
    }
    
    func setDetailsForSelectedRow(for index: Int) {
        let data = weatherData[index]
        
        temperature = "\(Int(data.main.temp))"
        feelsLike = "Feels Like: \(Int(data.main.feels_like))"
        condition = data.weather[0].main
        conditionDetails = data.weather[0].description
    }
    
    
}


    

