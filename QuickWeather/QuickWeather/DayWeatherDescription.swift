//
//  DayWeatherDescription.swift
//  QuickWeather
//
//  Created by Maru on 28.07.2022.
//

import Foundation

struct DayWeatherDescription: Hashable {
    var locationName: String
    var weekDay: String
    var dateString: String
    var condition: Condition
    var temperature: String
    var windSpeed: String
    var humidity: String
    var airPressure: String
}

extension Condition {
    var imageName: String {
        switch self {
        case .clear: return "clear_condition"
        case .fewClouds: return "few_clouds_condition"
        case .overcastClouds: return "overcast_clouds_condition"
        case .rain: return "rain_condition"
        case .heavyRain: return "heavy_rain_condition"
        case .thunderstorm: return "thunderstorm_condition"
        case .snow: return "snow_condition"
        }
    }

    var description: String {
        switch self {
        case .clear: return "clear"
        case .fewClouds: return "few clouds"
        case .overcastClouds: return "overcast clouds"
        case .rain: return "rainy"
        case .heavyRain: return "heavy rainy"
        case .thunderstorm: return "thunderstorm"
        case .snow: return "snowy"
        }
    }
}
