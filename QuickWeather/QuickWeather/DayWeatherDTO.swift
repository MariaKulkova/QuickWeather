//
//  WeatherDTO.swift
//  QuickWeather
//
//  Created by Maru on 16.08.2022.
//

import Foundation

struct DayWeatherDTO: Decodable {

    struct Weather: Decodable {
        var main: String
        var description: String
    }

    struct MainInfo: Decodable {
        var temp: Double
        var pressure: Double
        var humidity: Double
    }

    struct Wind: Decodable {
        var speed: Double
    }

    var weather: [Weather]
    var main: MainInfo
    var wind: Wind
    var date: Date

    private enum CodingKeys: String, CodingKey {
        case weather
        case main
        case wind
        case date = "dt"
    }
}
