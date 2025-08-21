//
//  WeatherViewModel.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/20/25.
//

import SwiftUI
import Foundation

enum BackgroundGradientStyle {
    case hot
    case sunny
    case cloudy
    case rainy
    
    var gradient: LinearGradient {
        switch self {
        case .hot:
            return LinearGradient (
                colors: [.hotRed, .hotOrange],
                startPoint: .top,
                endPoint: .bottom
            )
        case .sunny:
            return LinearGradient (
                colors: [.sunnyBlue, .sunnyGreen],
                startPoint: .top,
                endPoint: .bottom
            )
        case .cloudy:
            return LinearGradient (
                colors: [.cloudyPurple, .cloudyYellow],
                startPoint: .top,
                endPoint: .bottom
            )
        case .rainy:
            return LinearGradient (
                colors: [.rainyBlue, .rainyPurple],
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
}

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var temperature: String = "--"
    @Published var condition: String = "--"
    @Published var region: String = "--"
    @Published var date: String = "--"
    @Published var time: String = "--"
    @Published var clouds: String = "--"
    @Published var humidity: String = "--"
    @Published var backgroundStyle: LinearGradient? = nil

    private let service = WeatherService()

    func fetchWeather() async {
        do {            
            print("VM::fetchWeather: \(Thread.current)")
            let response = try await service.fetchWeather()
            print("VM::fetchWeather: \(Thread.current)")
            let weatherDomain = response.toDomain()
            toString(weatherData: weatherDomain)
            changeBackground(weatherData: weatherDomain)
            print("VM::property 변경: \(Thread.current)")
        } catch {
            temperature = "Error"
        }
    }

    func toString(weatherData: WeatherDomain) {
        temperature = String(format: "%.1fºC", weatherData.temperature)
        condition = weatherData.condition
        region = weatherData.region
        date = DateFormatter.localizedString(
            from: weatherData.date,
            dateStyle: .medium,
            timeStyle: .none
        )
        time = DateFormatter.localizedString(
            from: weatherData.date,
            dateStyle: .none,
            timeStyle: .short
        )
        clouds = "\(weatherData.clouds)%"
        humidity = "\(weatherData.humidity)%"
    }
    
    func changeBackground(weatherData: WeatherDomain) {
        switch weatherData.condition {
        case "sunny":
            backgroundStyle = BackgroundGradientStyle.sunny.gradient
        case "cloudy":
            backgroundStyle = BackgroundGradientStyle.cloudy.gradient
        case "rainy":
            backgroundStyle = BackgroundGradientStyle.rainy.gradient
        default:
            backgroundStyle = BackgroundGradientStyle.sunny.gradient
        }
        if weatherData.temperature > 27 {
            backgroundStyle = BackgroundGradientStyle.hot.gradient
        }
    }
}
