//
//  WeatherViewModel.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/20/25.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var temperature: String = "27ºC"
    @Published var condition: String = "Sunny"
    @Published var region: String = "제주"
    @Published var date: String = "8월 20일"
    @Published var timeRange: String = "7:00 - 8:00 pm"
    @Published var clouds: String = "20%"
    @Published var humidity: String = "40%"
}
