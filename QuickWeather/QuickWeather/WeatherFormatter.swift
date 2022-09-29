//
//  WeatherFormatter.swift
//  QuickWeather
//
//  Created by Maru on 16.08.2022.
//

import Foundation

class WeatherFormatter {
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    func description(from weather: DayWeather) -> DayWeatherDescription {
        DayWeatherDescription(
            locationName: "Taganrog",
            weekDay: weather.date.dayOfWeek,
            dateString: dateFormatter.string(from: weather.date),
            condition: weather.condition,
            temperature: weather.temperature.description,
            windSpeed: weather.windSpeed.description,
            humidity: weather.humidity.description,
            airPressure: weather.airPressure.description
        )
    }
}

extension Date {
    var dayOfWeek: String {
        let index = Calendar.current.component(.weekday, from: Date())
        return Calendar.current.weekdaySymbols[index - 1]
    }
}
