//
//  QuickWeatherApp.swift
//  QuickWeather
//
//  Created by Maru on 27.06.2022.
//

import SwiftUI

@main
struct QuickWeatherApp: App {
    let store = Store(initialState: WeatherState(), reducer: weatherReducer, environment: AppEnvironment())

    var body: some Scene {
        WindowGroup {
            WeatherForecastView()
                .environmentObject(store)
        }
    }
}
