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
    
    var body: some View {
        List(viewModel.searchResults, id: \.self) { timezone in
            Button(timezone) {
                contentViewModel.addTimeZone(timezone)
            }
        }
        .navigationTitle("Add new time")
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    NewTimeView()
}
