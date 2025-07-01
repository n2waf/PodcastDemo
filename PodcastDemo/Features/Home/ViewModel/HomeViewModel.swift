//
//  HomeViewModel.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var sections: [HomeSection] = []
    
    private let networkManager = NetworkManager.shared
    
    func loadHomeSections() async {
        guard let url = APIEndpoints.homeSectionsURL() else { return }
        
        do {
            let response = try await networkManager.fetch(HomeResponse.self, from: url)
            sections = sortSectionsWithQueueFirst(response.sections)
        } catch {
            print("Error loading sections: \(error)")
        }
    }
    
    private func sortSectionsWithQueueFirst(_ sections: [HomeSection]) -> [HomeSection] {
        let queueSections = sections.filter { $0.info.displayType == .queue }
        let otherSections = sections.filter { $0.info.displayType != .queue }
        
        let sortedQueueSections = queueSections.sorted { $0.info.order < $1.info.order }
        let sortedOtherSections = otherSections.sorted { $0.info.order < $1.info.order }
        
        
        return sortedQueueSections + sortedOtherSections
    }
}
