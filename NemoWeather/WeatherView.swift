//
//  ContentView.swift
//  NemoWeather
//
//  Created by Oh Seojin on 8/20/25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("NemoWeather")
                .font(.title)
                .foregroundColor(.gray)
            VStack(alignment: .leading) {
                Text(viewModel.temperature)
                    .font(.largeTitle)
                    .bold()
                Text(viewModel.condition)
                    .bold()
                    .font(.title3)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(viewModel.region)
                    .bold()
                Divider()
                    .frame(maxWidth: 100, maxHeight: 3)
                    .background(.gray)
            }
            VStack(alignment: .leading) {
                Text(viewModel.date)
                    .font(.largeTitle)
                Text(viewModel.timeRange)
                    .font(.title3)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("COLOUDS")
                        .font(.title2)
                    Text(viewModel.clouds)
                        .font(.title2)
                }
                Spacer()
                Divider()
                    .frame(maxWidth: 1, maxHeight: 80)
                    .background(.gray)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("HUMIDITY")
                        .font(.title2)
                    Text(viewModel.humidity)
                        .font(.title2)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(40)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    WeatherView()
}
