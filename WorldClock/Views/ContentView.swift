//
//  ContentView.swift
//  WorldClock
//
//  Created by Мария Газизова on 21.10.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State var path: [NavigationDestination]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    ForEach(viewModel.timeZonesNotString, id: \.self) { timezone in
                        VStack(alignment: .leading) {
                            Text(timezone.prettyDescription)
                            Text(viewModel.time(for: timezone.identifier))
                        }
                    }
                    .onDelete(perform: viewModel.deleteTimeZoneNotString)
                }
                Button("Add new timezone") {
                    path.append(.NewTime)
                }
            }
            .navigationDestination(for: NavigationDestination.self) { selection in
                switch selection {
                case .NewTime:
                    NewTimeView(path: $path)
                        .environmentObject(viewModel)
                }
            }
            .navigationTitle("World clock")
        }
    }
}

#Preview {
    ContentView(path: [])
}
