//
//  LoadJson.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/20/25.
//

import Foundation

func loadSampleWeather() -> WeatherDTO? {
    guard let url = Bundle.main.url(forResource: "Sample", withExtension: "json") else {
        print("Sample.json not found in main bundle.")
        return nil
    }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let weather = try decoder.decode(WeatherDTO.self, from: data)
        return weather
    } catch {
        print("Failed to load or decode Sample.json: \(error)")
        return nil
    }
}

