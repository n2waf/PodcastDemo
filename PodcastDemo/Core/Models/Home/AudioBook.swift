//
//  AudioBook.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

// MARK: - AudioBook Model
struct AudioBook: ContentItem {
    let audiobookId: String
    let name: String
    let authorName: String
    let description: String
    let avatarUrl: String
    let duration: Int
    let language: String
    let releaseDate: String
    let score: Double
    
    var id: String { audiobookId }
    
    enum CodingKeys: String, CodingKey {
        case audiobookId = "audiobook_id"
        case name
        case authorName = "author_name"
        case description
        case avatarUrl = "avatar_url"
        case duration
        case language
        case releaseDate = "release_date"
        case score
    }
}
