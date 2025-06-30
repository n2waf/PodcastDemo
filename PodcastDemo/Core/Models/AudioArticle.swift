//
//  AudioArticle.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

struct AudioArticle: ContentItem {
    let articleId: String
    let name: String
    let authorName: String
    let description: String
    let avatarUrl: String
    let duration: Int
    let releaseDate: String
    let score: Double
    
    var id: String { articleId }
    
    enum CodingKeys: String, CodingKey {
        case articleId = "article_id"
        case name
        case authorName = "author_name"
        case description
        case avatarUrl = "avatar_url"
        case duration
        case releaseDate = "release_date"
        case score
    }
}
