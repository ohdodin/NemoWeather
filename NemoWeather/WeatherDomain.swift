//
//  Weather.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/20/25.
//

import Foundation

struct WeatherDomain {
    var temperature: Double
    var condition: String
    var region: String
    var date: Date
    var clouds: Int
    var humidity: Int
    
    init(temperature: Double, condition: String, region: String, clouds: Int, humidity: Int) {
        self.temperature = temperature
        self.condition = condition
        self.region = region
        self.clouds = clouds
        self.humidity = humidity
        self.date = Date()
    }
}
