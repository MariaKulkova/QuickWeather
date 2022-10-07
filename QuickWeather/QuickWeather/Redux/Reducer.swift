//
//  Reducer.swift
//  QuickWeather
//
//  Created by Maru on 29.08.2022.
//

import Foundation
import SwiftUI

struct Reducer<State, Action, Environment> {
    typealias Change = (inout State) -> Void
    let reduce: (State, Action, Environment) async -> Change
}

final class Store<State, Action, Environment>: ObservableObject {

    @Published private(set) var state: State

    private let reducer: Reducer<State, Action, Environment>
    private let environment: Environment

    init(
        initialState: State,
        reducer: Reducer<State, Action, Environment>,
        environment: Environment
    ) {
        self.state = initialState
        self.reducer = reducer
        self.environment = environment
    }

    func send(_ action: Action) {
        Task {
            let change = await reducer.reduce(state, action, environment)
            await MainActor.run { perform(change: change) }
        }
    }

    private func perform(change: Reducer<State, Action, Environment>.Change) {
        change(&state)
    }
}

struct WeatherState {
    var forecast: [DayWeatherDescription] = []
}

enum WeatherAction {
    case reload(location: Location)
}

let weatherReducer: Reducer<WeatherState, WeatherAction, AppEnvironment> = {
    Reducer { state, action, environment in
        var forecast: [DayWeatherDescription] = []

        switch action {
        case .reload(let location):
            if let weather = try? await environment.dataSource.getWeatherForecast(location: location) {
                forecast = [weather].map { environment.formatter.description(from: $0) }
            }
        }

        return { state in
            state.forecast = forecast
        }
    }
}()

struct AppEnvironment {
    var dataSource: WeatherDataSource = RemoteWeatherDataSource()
    var formatter: WeatherFormatter = WeatherFormatter()
}
