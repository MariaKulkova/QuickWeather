//
//  ShortDailyWeatherView.swift
//  QuickWeather
//
//  Created by Maru on 27.06.2022.
//

import SwiftUI

struct ShortDailyWeatherView: View {
    var weather: DayWeatherDescription

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(weather.weekDay)
                    Text(weather.dateString)
                }
                .font(.system(size: 14))

                Spacer()

                Image(weather.condition.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Spacer()
                .layoutPriority(1)

            HStack {
                Text(weather.temperature)
                    .font(.system(size: 18))

                Spacer()

                Text(weather.windSpeed)
                    .font(.system(size: 14))
            }
        }
    }
}

struct ShortDailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ShortDailyWeatherView(
            weather: DayWeatherDescription(
                locationName: "Rostov-on-Don",
                weekDay: "Monday",
                dateString: "22 june",
                condition: .fewClouds,
                temperature: "23°C",
                windSpeed: "5 m/s",
                humidity: "60 %",
                airPressure: "0.553 mBar"
            )
        )
        .frame(maxWidth: 200)
        .frame(height: 100)
    }
}
