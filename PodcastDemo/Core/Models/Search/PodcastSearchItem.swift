//
//  PodcastSearchItem.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import Foundation

struct PodcastSearchItem: Codable, Identifiable {

    let id: String
    let name: String
    let avatarUrl: String
    let score: String
    let duration: String
    let description: String
    let episodeCount: String
    let language: String
    let priority: String
    let popularityScore: String

    // MARK: - Coding
    enum CodingKeys: String, CodingKey {
        case id = "podcast_id"
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
    
    var toContentItem: SearchItem {
        let duration = Int(duration.replacingOccurrences(of: ":", with: "")) ?? 0
        let score = Double(score) ?? 0
        return SearchItem(id: self.id,
                          name: self.name,
                          avatarUrl: self.avatarUrl,
                          score: score,
                          releaseDate: "",
                          duration: duration)
    }
    
}

struct SearchItem: ContentItem {
    var id: String
    var name: String
    var avatarUrl: String
    var score: Double
    var releaseDate: String
    var duration: Int
}
