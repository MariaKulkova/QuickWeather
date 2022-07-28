//
//  DayWeather.swift
//  QuickWeather
//
//  Created by Maru on 28.06.2022.
//

import Foundation

enum Condition {
    case clear
    case fewClouds
    case overcastClouds
    case rain
    case heavyRain
    case thunderstorm
    case snow
}

struct DayWeather {
    var date: Date
    var condition: Condition
    var temperature: Measurement<UnitTemperature>
    var windSpeed: Measurement<UnitSpeed>
    var humidity: Double // Convert to custom unit and use with Measurement
    var airPressure: Measurement<UnitPressure>
}
