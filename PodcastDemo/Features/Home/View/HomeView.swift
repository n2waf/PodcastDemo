//
//  ContentView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            Text("Sections: \(viewModel.sections.count)")
            Button("Load Sections") {
                Task {
                    await viewModel.loadHomeSections()
                }
            }
            // Display section names for testing
            List(viewModel.sections) { section in
                Text(section.info.name)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadHomeSections()
            }
        }
    }
}

#Preview {
    HomeView()
}
