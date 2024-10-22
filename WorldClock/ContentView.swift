//
//  ContentView.swift
//  WorldClock
//
//  Created by Мария Газизова on 21.10.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack() {
            List(viewModel.timeZones, id: \.self) { timeZone in
                VStack(alignment: .leading) {
                    Text(timeZone)
                    Text(viewModel.time(for: timeZone))
                }
            }
            
            NavigationLink("Add new time") {
                NewTimeView()
                    .environmentObject(viewModel)
            }
            .navigationTitle("World clock")
        }
    }
}

#Preview {
    ContentView()
}
