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
                    
                    if viewModel.hasMorePages {
                        Color.clear
                            .frame(height: 1)
                            .onAppear {
                                Task {
                                    await viewModel.loadMoreSectionsIfNeeded()
                                }
                            }
                    }
                    
                    if viewModel.isLoadingMore {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .padding()
                    }
                }
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
