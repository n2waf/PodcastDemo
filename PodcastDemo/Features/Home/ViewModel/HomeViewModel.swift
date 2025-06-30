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
            sections = response.sections
        } catch {
            print("Error loading sections: \(error)")
        }
    }
}
