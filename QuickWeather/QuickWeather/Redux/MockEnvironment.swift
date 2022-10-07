//
//  MockEnvironment.swift
//  QuickWeather
//
//  Created by Maru on 30.08.2022.
//

import Foundation

extension AppEnvironment {
    static let mock = AppEnvironment(
        dataSource: MockWeatherDataSource(),
        formatter: WeatherFormatter()
    )
}

class MockWeatherDataSource: WeatherDataSource {
    func getWeatherForecast(location: Location) async throws -> DayWeather {
        DayWeather(
            date: Date(),
            condition: .clear,
            temperature: Measurement(value: 28, unit: .celsius),
            windSpeed: Measurement(value: 2, unit: .metersPerSecond),
            humidity: 60,
            airPressure: Measurement(value: 0.553, unit: .millibars)
        )
    }
}
