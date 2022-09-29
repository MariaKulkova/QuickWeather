//
//  DayWeather.swift
//  QuickWeather
//
//  Created by Maru on 28.06.2022.
//

import Foundation

enum Condition: String, Codable {
    case clear
    case clouds
    case overcastClouds
    case rain
    case heavyRain
    case thunderstorm
    case snow
    case undefined
}

struct DayWeather: Codable {
    var date: Date
    var condition: Condition
    var temperature: Measurement<UnitTemperature>
    var windSpeed: Measurement<UnitSpeed>
    var humidity: Double // Convert to custom unit and use with Measurement
    var airPressure: Measurement<UnitPressure>
}

struct Location {
    var city: String
    var state: String?
    var country: String?
}

struct Forecast {
    var city: Location
    var weather: [DayWeather]
}
