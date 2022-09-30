//
//  WeatherForecastView.swift
//  QuickWeather
//
//  Created by Maru on 27.06.2022.
//

import SwiftUI

struct WeatherForecastView: View {

    @EnvironmentObject private var store: Store<WeatherState, WeatherAction, AppEnvironment>

    private let gridItems = [
        GridItem(.adaptive(minimum: 140), spacing: 16)
    ]

    var body: some View {
        VStack {
            if let todayWeather = store.state.forecast.first {
                TodayWeatherView(weather: todayWeather)
                    .onTapGesture {
                        store.send(.reload(location: Location(city: "Vladivostok")))
                    }
            }

            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(store.state.forecast.dropFirst(), id: \.self) { item in
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
        .onAppear { store.send(.reload(location: Location(city: "Taganrog"))) }
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static let store = Store(
        initialState: WeatherState(),
        reducer: weatherReducer,
        environment: AppEnvironment.mock
    )

    static var previews: some View {
        Group {
            WeatherForecastView()
                .previewInterfaceOrientation(.portrait)

            WeatherForecastView()
                .previewInterfaceOrientation(.portrait)
                .preferredColorScheme(.dark)
        }
        .environmentObject(store)
    }
}
