//
//  WeatherService.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/20/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class WeatherService {
    let url = URL(
        string:
            "https://api.openweathermap.org/data/2.5/weather?q=Jeju&appid=\(Bundle.main.OPENWEATHERMAP_API_KEY)"
    )

    func fetchWeather() async throws -> WeatherDTO {
        print("강제 3초 지연: \(Thread.current)")
        try await Task.sleep(for: .seconds(3))
        print("fetchWeather 진입+지연후: \(Thread.current)")
        guard let url else {
            throw NetworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 /* OK */
        else {
            throw NetworkError.noData
        }

        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherDTO.self, from: data)
            print("fetchWeather 반환전: \(Thread.current)")
            return weatherData
        } catch {
            throw NetworkError.decodingError
        }

    }
}
