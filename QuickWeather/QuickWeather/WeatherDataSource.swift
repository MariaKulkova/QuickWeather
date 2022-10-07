//
//  WeatherDataSource.swift
//  QuickWeather
//
//  Created by Maru on 11.08.2022.
//

import Foundation
import SwiftUI

enum WeatherError: Error {
    case unknownLocation
}

protocol WeatherDataSource {
    func getWeatherForecast(location: Location) async throws -> DayWeather
}

class RemoteWeatherDataSource: WeatherDataSource {

    var api: APIRequesting = APIService()

    func getWeatherForecast(location: Location) async throws -> DayWeather {
        let request = AnyRequest<Void, DayWeatherDTO>(
            endpoint: "https://api.openweathermap.org/data/2.5/weather",
            method: .get,
            queryParameters: ["q": location.city, "appid": "d4a691ca4b983c713a17461d8751f661", "units": "metric"],
            parameters: nil,
            encoder: voidEncoder,
            decoder: jsonDecoder
        )

        let result = try await api.call(request)
        return weather(from: result)
    }
}

func weather(from object: DayWeatherDTO) -> DayWeather {
    DayWeather(
        date: object.date,
        condition: object.weather.first.flatMap { Condition(rawValue: $0.main.lowercased()) } ?? .undefined,
        temperature: .init(value: object.main.temp, unit: .celsius),
        windSpeed: .init(value: object.wind.speed, unit: .metersPerSecond),
        humidity: object.main.humidity,
        airPressure: .init(value: object.main.pressure, unit: .millibars)
    )
}
