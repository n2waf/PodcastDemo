//
//  ContentProtocol.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//

import Foundation

// MARK: - Content Types Protocol
protocol ContentItem: Decodable, Identifiable {
    var name: String { get }
    var avatarUrl: String { get }
    var score: Double { get }
    var releaseDate: String { get }
    var duration: Int { get }
}

// MARK: - Playable Protocol
protocol PlayableContent: ContentItem {
    var duration: Int { get }
    var audioUrl: String { get }
}
