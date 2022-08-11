//
//  TodayWeatherView.swift
//  QuickWeather
//
//  Created by Maru on 27.06.2022.
//

import SwiftUI

struct TodayWeatherView: View {
    var weather: DayWeatherDescription

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(weather.locationName)
                    .font(.system(size: 18))

                Image(systemName: "location")
                Spacer()
            }

            HStack {
                VStack(alignment: .leading) {
                    Text(weather.temperature)
                        .font(.system(size: 64))

                    Text("It's \(weather.condition.description)")
                        .font(.system(size: 18))

                    Text("\(weather.weekDay), \(weather.dateString)")
                        .font(.system(size: 18))
                }

                Spacer()

                Image(weather.condition.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
            }
            .padding(.init(top: 4, leading: 0, bottom: 24, trailing: 0))

            HStack {
                ConditionView(text: weather.windSpeed, systemImage: "wind")
                Spacer()
                ConditionView(text: weather.humidity, systemImage: "drop")
                Spacer()
                ConditionView(text: weather.airPressure, systemImage: "speedometer")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

private struct ConditionView: View {
    let image: Image
    let text: String

    init(text: String, image: String) {
        self.text = text
        self.image = Image(image)
    }

    init(text: String, systemImage: String) {
        self.text = text
        self.image = Image(systemName: systemImage)
    }

    var body: some View {
        HStack(spacing: 8) {
            image
                .renderingMode(.template)
                .foregroundColor(.gray)

            Text(text)
                .font(.system(size: 14))
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(
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
    }
}
