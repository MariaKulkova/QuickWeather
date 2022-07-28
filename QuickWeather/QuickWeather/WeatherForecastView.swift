//
//  WeatherForecastView.swift
//  QuickWeather
//
//  Created by Maru on 27.06.2022.
//

import SwiftUI

struct WeatherForecastView: View {

    var weatherForecast: [DayWeatherDescription]

    private let gridItems = [
        GridItem(.adaptive(minimum: 140), spacing: 16)
    ]

    var body: some View {
        VStack {
            if let todayWeather = weatherForecast.first {
                TodayWeatherView(weather: todayWeather)
            }

            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(weatherForecast.dropFirst(), id: \.self) { item in
                        ShortDailyWeatherView(weather: item)
                            .padding(14)
                            .frame(maxHeight: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }
                }
                .padding(16)
            }
        }
        .foregroundColor(.primaryText)
        .background(Color.primaryBackground)
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherForecastView(weatherForecast: stubForecast)
                .previewInterfaceOrientation(.portrait)

            WeatherForecastView(weatherForecast: stubForecast)
                .previewInterfaceOrientation(.portrait)
                .preferredColorScheme(.dark)
        }
    }
}
