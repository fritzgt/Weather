//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by FGT MAC on 5/30/21.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {

    func testLoadingData() {
        let mock = MockLoader()
        mock.data = weatherJSON
        var results: Weather?
        let controller = Service(loader: mock)
        let resultExpectation = expectation(description: "Wait for results")
        
        controller.fetchWeather(for: "Miami") { weather, Error in
            resultExpectation.fulfill()
            results = weather
        }
        
        wait(for: [resultExpectation], timeout: 2.0)
        
        XCTAssertTrue(results?.list.count == 2, "Expecting 2 results for Miami")
        XCTAssertEqual(results?.list[0].main.feels_like, 299.02)
        XCTAssertEqual(results!.list[1].main.temp, 299.21)
    }

}
