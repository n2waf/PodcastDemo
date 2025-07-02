//
//  HomeSection+Extensions.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

// MARK: - HomeSection Extension
extension Section {
    var items: [any ContentItem] {
        switch self {
        case .podcasts(_, let podcasts):
            return podcasts
        case .episodes(_, let episodes):
            return episodes
        case .audioBooks(_, let audioBooks):
            return audioBooks
        case .audioArticles(_, let audioArticles):
            return audioArticles
            case .search(_, let searchResult):
            return searchResult
        }
    }
}
