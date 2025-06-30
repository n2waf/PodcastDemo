//
//  Podcast.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

// MARK: - Podcast Model
struct Podcast: ContentItem {
    let podcastId: String
    let name: String
    let description: String
    let avatarUrl: String
    let episodeCount: Int
    let duration: Int
    let language: String?
    let priority: Int
    let popularityScore: Int
    let score: Double
    
    var id: String { podcastId }
    
    enum CodingKeys: String, CodingKey {
        case podcastId = "podcast_id"
        case name
        case description
        case avatarUrl = "avatar_url"
        case episodeCount = "episode_count"
        case duration
        case language
        case priority
        case popularityScore
        case score
    }
}
