//
//  HomeSection.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//


import Foundation

// MARK: - Section Display Type Enum
enum SectionDisplayType: String, Codable {
    case square
    case bigSquare = "big_square"
    case twoLinesGrid = "2_lines_grid"
    case queue
}

// MARK: - Content Type Enum
enum ContentType: String, Codable {
    case podcast
    case episode
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
}

// MARK: - Home Section
enum HomeSection: Identifiable {
    case podcasts(SectionInfo, [Podcast])
    case episodes(SectionInfo, [Episode])
    case audioBooks(SectionInfo, [AudioBook])
    case audioArticles(SectionInfo, [AudioArticle])
    
    struct SectionInfo {
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
        }
    }
}

// MARK: - Custom Decoding Strategy
extension HomeSection: Decodable {
    private enum CodingKeys: String, CodingKey {
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
}

// MARK: - Home Response
struct HomeResponse: Decodable {
    let sections: [HomeSection]
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Decodable {
    let nextPage: String?
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}
