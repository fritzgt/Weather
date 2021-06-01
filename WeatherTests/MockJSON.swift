//
//  MockJSON.swift
//  WeatherTests
//
//  Created by FGT MAC on 5/31/21.
//

import Foundation

let weatherJSON = """
    
    {
      "cod": "200",
      "message": 0,
      "cnt": 40,
      "list": [
        {
          "dt": 1622451600,
          "main": {
            "temp": 298.43,
            "feels_like": 299.02,
            "temp_min": 298.43,
            "temp_max": 299.08,
            "pressure": 1018,
            "sea_level": 1018,
            "grnd_level": 1018,
            "humidity": 77,
            "temp_kf": -0.65
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10n"
            }
          ],
          "clouds": {
            "all": 15
          },
          "wind": {
            "speed": 3.81,
            "deg": 103,
            "gust": 4.6
          },
          "visibility": 10000,
          "pop": 0.91,
          "rain": {
            "3h": 2.06
          },
          "sys": {
            "pod": "n"
          },
          "dt_txt": "2021-05-31 09:00:00"
        },
        {
          "dt": 1622462400,
          "main": {
            "temp": 299.21,
            "feels_like": 299.21,
            "temp_min": 299.21,
            "temp_max": 299.77,
            "pressure": 1019,
            "sea_level": 1019,
            "grnd_level": 1019,
            "humidity": 74,
            "temp_kf": -0.56
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10d"
            }
          ],
          "clouds": {
            "all": 11
          },
          "wind": {
            "speed": 3.83,
            "deg": 102,
            "gust": 4.28
          },
          "visibility": 10000,
          "pop": 0.89,
          "rain": {
            "3h": 0.58
          },
          "sys": {
            "pod": "d"
          },
          "dt_txt": "2021-05-31 12:00:00"
        }
      ],
      "city": {
        "id": 4164138,
        "name": "Miami",
        "coord": {
          "lat": 25.7743,
          "lon": -80.1937
        },
        "country": "US",
        "population": 399457,
        "timezone": -14400,
        "sunrise": 1622456980,
        "sunset": 1622506061
      }
    }
""".data(using: .utf8)
