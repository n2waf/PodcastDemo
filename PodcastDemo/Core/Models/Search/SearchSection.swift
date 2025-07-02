//
//  SearchSection.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import Foundation

struct SearchSection: Codable, Identifiable{
    let id = UUID()
    let name: String
    let type: String
    let order: String
    let contentType: String
    let items: [PodcastSearchItem]

    enum CodingKeys: String, CodingKey {
        case name
        case order
        case type
        case contentType = "content_type"
        case items = "content"
    }
    
}

struct SearchResponse: Codable {
    let sections: [SearchSection]
}
