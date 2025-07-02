//
//  SearchViewModel.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import Foundation

@MainActor
final class SearchViewModel: ObservableObject {

    // MARK: - Published
    @Published var query: String = "" {
        didSet { scheduleSearch() }
    }
    @Published private(set) var searchResult: [SearchSection] = []
    @Published private(set) var isSearching = false

    // MARK: - Private
    private let network: NetworkManager = NetworkManager()
    private var searchTask: Task<Void, Never>?

    private func scheduleSearch() {
        searchTask?.cancel()
        guard !query.isEmpty else { searchResult = []; return }

        searchTask = Task {
            try? await Task.sleep(for: .milliseconds(200))
            guard !Task.isCancelled else { return }

            await performSearch()
        }
    }

    private func performSearch() async {
        isSearching = true
        defer { isSearching = false }

        do {
            let response = try await network.get(SearchResponse.self,from: .search(query: query, page: 1))
            searchResult = response.sections
        } catch {
            searchResult = []
            print("Search error:", error.localizedDescription)
        }
    }
}
