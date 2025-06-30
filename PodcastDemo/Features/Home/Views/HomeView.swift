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
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.sections) { section in
                        SectionView(section: section)
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
            .onAppear {
                Task {
                    await viewModel.loadHomeSections()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
