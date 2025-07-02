//
//  SearchView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                if viewModel.isSearching && viewModel.searchResult.isEmpty {
                    ProgressView().padding(.top, 40)
                }

                ForEach(viewModel.searchResult) { section in
                    SectionView(section: .search(section.name, section.items.contentSections))
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Search")
        .searchable(text: $viewModel.query,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Type to search")
        .disableAutocorrection(true)
    }
}

fileprivate extension Array where Element == PodcastSearchItem {
    var contentSections: [SearchItem] {
        return map (\.toContentItem)
    }
}
