//
//  QuickWeatherApp.swift
//  QuickWeather
//
//  Created by Maru on 27.06.2022.
//

import SwiftUI

@main
struct QuickWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherForecastView(weatherForecast: stubForecast)
        }
    }
}

let stubForecast: [DayWeatherDescription] = [
    DayWeatherDescription(
        locationName: "Rostov-on-Don",
        weekDay: "Monday",
        dateString: "28 Jule",
        condition: .clear,
        temperature: "28°C",
        windSpeed: "2 m/s",
        humidity: "60 %",
        airPressure: "0.553 mBar"
    ),
    DayWeatherDescription(
        locationName: "Rostov-on-Don",
        weekDay: "Monday",
        dateString: "29 Jule",
        condition: .fewClouds,
        temperature: "26°C",
        windSpeed: "5 m/s",
        humidity: "60 %",
        airPressure: "0.553 mBar"
    ),
    DayWeatherDescription(
        locationName: "Rostov-on-Don",
        weekDay: "Monday",
        dateString: "30 Jule",
        condition: .fewClouds,
        temperature: "24°C",
        windSpeed: "7 m/s",
        humidity: "60 %",
        airPressure: "0.553 mBar"
    ),
    DayWeatherDescription(
        locationName: "Rostov-on-Don",
        weekDay: "Monday",
        dateString: "31 Jule",
        condition: .rain,
        temperature: "18°C",
        windSpeed: "6 m/s",
        humidity: "60 %",
        airPressure: "0.553 mBar"
    ),
    DayWeatherDescription(
        locationName: "Rostov-on-Don",
        weekDay: "Monday",
        dateString: "1 August",
        condition: .clear,
        temperature: "25°C",
        windSpeed: "1 m/s",
        humidity: "40 %",
        airPressure: "0.553 mBar"
    ),
    DayWeatherDescription(
        locationName: "Rostov-on-Don",
        weekDay: "Monday",
        dateString: "2 August",
        condition: .overcastClouds,
        temperature: "23°C",
        windSpeed: "5 m/s",
        humidity: "60 %",
        airPressure: "0.553 mBar"
    ),
    DayWeatherDescription(
        locationName: "Rostov-on-Don",
        weekDay: "Monday",
        dateString: "3 August",
        condition: .heavyRain,
        temperature: "20°C",
        windSpeed: "10 m/s",
        humidity: "80 %",
        airPressure: "0.553 mBar"
    )
]
