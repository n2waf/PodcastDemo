//
//  HomeSection.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//


import Foundation

// MARK: - Section Display Type
enum SectionDisplayType: String, Codable {
    case square
    case bigSquare = "big_square"
    case twoLinesGrid = "2_lines_grid"
    case queue
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        
        switch value {
        case "square":
            self = .square
        case "big_square", "big square": 
            self = .bigSquare
        case "2_lines_grid":
            self = .twoLinesGrid
        case "queue":
            self = .queue
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Cannot initialize SectionDisplayType from invalid String value \(value)"
                )
            )
        }
    }
}

// MARK: - Content Type
enum ContentType: String, Codable {
    case podcast
    case episode
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
}

// MARK: - Home Section
enum Section: Codable, Identifiable {
    case podcasts(SectionInfo, [Podcast])
    case episodes(SectionInfo, [Episode])
    case audioBooks(SectionInfo, [AudioBook])
    case audioArticles(SectionInfo, [AudioArticle])
    case search(String, [SearchItem])
    
    struct SectionInfo: Codable {
        let name: String
        let displayType: SectionDisplayType
        let order: Int
    }
    
    var id: String {
        "\(info.name)_\(info.order)"
    }
    
    var info: SectionInfo {
        switch self {
        case .podcasts(let info, _),
             .episodes(let info, _),
             .audioBooks(let info, _),
             .audioArticles(let info, _):
            return info
        case let .search(sectionTitle, _):
            return .init(name: sectionTitle, displayType: .square, order: 0)
        }
    }
    
    var itemCount: Int {
        switch self {
        case .podcasts(_, let items):
            return items.count
        case .episodes(_, let items):
            return items.count
        case .audioBooks(_, let items):
            return items.count
        case .audioArticles(_, let items):
            return items.count
        case .search(_, let items):
            return items.count
        }
    }
    
}

// MARK: - Custom Decoding Strategy
extension Section {
    
    private enum CodingKeys: String, CodingKey, Codable {
        case name
        case type
        case contentType = "content_type"
        case order
        case content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try container.decode(String.self, forKey: .name)
        let displayType = try container.decode(SectionDisplayType.self, forKey: .type)
        let contentType = try container.decode(ContentType.self, forKey: .contentType)
        let order = try container.decode(Int.self, forKey: .order)
        
        let sectionInfo = SectionInfo(
            name: name,
            displayType: displayType,
            order: order
        )
        
        // Decode content based on content type
        switch contentType {
        case .podcast:
            let podcasts = try container.decode([Podcast].self, forKey: .content)
            self = .podcasts(sectionInfo, podcasts)
            
        case .episode:
            let episodes = try container.decode([Episode].self, forKey: .content)
            self = .episodes(sectionInfo, episodes)
            
        case .audioBook:
            let audioBooks = try container.decode([AudioBook].self, forKey: .content)
            self = .audioBooks(sectionInfo, audioBooks)
            
        case .audioArticle:
            let audioArticles = try container.decode([AudioArticle].self, forKey: .content)
            self = .audioArticles(sectionInfo, audioArticles)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        let info = self.info
        try container.encode(info.name, forKey: .name)
        try container.encode(info.displayType, forKey: .type)
        try container.encode(info.order, forKey: .order)
        
        switch self {
        case .podcasts(_, let podcasts):
            try container.encode(ContentType.podcast, forKey: .contentType)
            try container.encode(podcasts, forKey: .content)
            
        case .episodes(_, let episodes):
            try container.encode(ContentType.episode, forKey: .contentType)
            try container.encode(episodes, forKey: .content)
            
        case .audioBooks(_, let audioBooks):
            try container.encode(ContentType.audioBook, forKey: .contentType)
            try container.encode(audioBooks, forKey: .content)
            
        case .audioArticles(_, let audioArticles):
            try container.encode(ContentType.audioArticle, forKey: .contentType)
            try container.encode(audioArticles, forKey: .content)
        case .search: break
        }
    }
}

// MARK: - Home Response
struct HomeResponse: Codable {
    let sections: [Section]
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Codable {
    let nextPage: String?
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}
