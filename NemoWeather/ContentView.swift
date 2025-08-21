//
//  ContentView.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/21/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink{
                WeatherView()
            } label: {
                Text("날씨 보러가기")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ContentView()
}
