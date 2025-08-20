//
//  NemoWeather++Bundle.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/20/25.
//

import Foundation

extension Bundle {
    var OPENWEATHERMAP_API_KEY: String {
        guard let file = self.path(forResource: "Secrets", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["OPENWEATHERMAP_API_KEY"] as? String else {
            fatalError("Secrets.plist에 OPENWEATHERMAP_API_KEY에 유요한 값을 설정해주세요.")
        }
        return key
    }
}
