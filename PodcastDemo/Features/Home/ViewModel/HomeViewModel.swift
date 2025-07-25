//
//  HomeViewModel.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var sections: [Section] = []
    @Published var isLoading = false
    @Published var isLoadingMore = false
    @Published var hasMorePages = true
    
    private let networkManager = NetworkManager()
    private var currentPage = 1
    private var totalPages = 1
    private var isCurrentlyLoading = false
    private var currentTask: Task<Void, Never>?
    
    func loadHomeSections() async {
        currentTask?.cancel()
        
        guard !isCurrentlyLoading else { return }
        
        isCurrentlyLoading = true
        isLoading = true
        currentPage = 1
        
        currentTask = Task {
            await fetchSections(page: currentPage, isInitialLoad: true)
        }
        
        await currentTask?.value
        
        isLoading = false
        isCurrentlyLoading = false
    }
    
    func loadMoreSectionsIfNeeded() async {
        guard !isCurrentlyLoading,
              hasMorePages,
              !isLoadingMore else {
            return
        }
        
        isCurrentlyLoading = true
        isLoadingMore = true
        
        let nextPage = currentPage + 1
        await fetchSections(page: nextPage, isInitialLoad: false)
        
        isLoadingMore = false
        isCurrentlyLoading = false
    }
    
    private func fetchSections(page: Int, isInitialLoad: Bool) async {

        do {
            let response = try await networkManager.get(HomeResponse.self, from: .home(page: page))
            
            if isInitialLoad {
                sections = sortSectionsWithQueueFirst(response.sections)
            } else {
                let newSections = sortSectionsWithQueueFirst(response.sections)
                sections.append(contentsOf: newSections)
            }
            
            currentPage = page
            totalPages = response.pagination.totalPages
            hasMorePages = currentPage < totalPages
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func sortSectionsWithQueueFirst(_ sections: [Section]) -> [Section] {
        let queueSections = sections.filter { $0.info.displayType == .queue }
        let otherSections = sections.filter { $0.info.displayType != .queue }
        
        let sortedQueueSections = queueSections.sorted { $0.info.order < $1.info.order }
        let sortedOtherSections = otherSections.sorted { $0.info.order < $1.info.order }
        
        return sortedQueueSections + sortedOtherSections
    }
}
