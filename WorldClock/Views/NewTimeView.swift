//
//  NewTimeView.swift
//  WorldClock
//
//  Created by Мария Газизова on 22.10.2024.
//

import SwiftUI

struct NewTimeView: View {
    @EnvironmentObject var contentViewModel: ContentView.ViewModel
    @State var viewModel = ViewModel()
    @Binding var path: [NavigationDestination]
    
    var body: some View {
        List(viewModel.searchResults, id: \.self) { timezone in
            Button {
                contentViewModel.addTimeZoneNotString(timezone)
                path.popLast()
            } label: {
                Text(TimeZone(identifier: timezone)?.prettyDescription ?? "")
            }
        }
        .navigationTitle("Add new time")
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    @State var path = [NavigationDestination]()
    return NewTimeView(path: $path)
}
