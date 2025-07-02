//
//  MockData.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import Foundation
@testable import PodcastDemo

struct MockData {
    
    // MARK: - Sample Models
    
    static let samplePodcast = Podcast(
        podcastId: "1612459752",
        name: "State of the World from NPR",
        description: "Immerse yourself in the most compelling stories from around the globe.",
        avatarUrl: "https://media.npr.org/assets/img/2023/10/11/stateofworld_sq.jpg",
        episodeCount: 805,
        duration: 314674,
        language: "en",
        priority: 4,
        popularityScore: 9,
        score: 215.5864
    )
    
    static let sampleEpisode = Episode(
        episodeId: "b1e20dca-8ee6-5184-af3f-1e0000eda912",
        name: "NPR News: 05-21-2024 10AM EDT",
        seasonNumber: nil,
        episodeType: .full,
        podcastName: "NPR News Now",
        authorName: "",
        description: "NPR News: 05-21-2024 10AM EDT",
        number: nil,
        duration: 300,
        avatarUrl: "https://media.npr.org/assets/img/2023/03/01/npr-news-now_square.png",
        separatedAudioUrl: "https://pub-7662547e64d14f4cbd999b0e42e8e636.r2.dev/separated-vocals/aebcf272-a3eb-5a92-be6d-c04bcefc97c9.mp3",
        audioUrl: "https://chrt.fm/track/138C95/prfx.byspotify.com/e/play.podtrac.com/npr-500005/traffic.megaphone.fm/NPR8018982612.mp3",
        releaseDate: "2024-05-21T14:00:00.000Z",
        podcastId: "33223131",
        chapters: [],
        podcastPopularityScore: 11,
        podcastPriority: 1,
        score: 233.96535,
        paidIsEarlyAccess: false,
        paidIsNowEarlyAccess: false,
        paidIsExclusive: false,
        paidTranscriptUrl: nil,
        freeTranscriptUrl: nil,
        paidIsExclusivePartially: false,
        paidExclusiveStartTime: 0,
        paidEarlyAccessDate: nil,
        paidEarlyAccessAudioUrl: nil,
        paidExclusivityType: nil
    )
    
    static let sampleAudioBook = AudioBook(
        audiobookId: "audiobook_001",
        name: "The Art of War",
        authorName: "Sun Tzu",
        description: "An ancient military text on strategy and tactics.",
        avatarUrl: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228",
        duration: 36000,
        language: "en",
        releaseDate: "2023-01-10T08:00:00Z",
        score: 500.0
    )
    
    static let sampleAudioArticle = AudioArticle(
        articleId: "article_001",
        name: "The Future of AI",
        authorName: "Tech World",
        description: "An in-depth look at the future impact of artificial intelligence.",
        avatarUrl: "https://bookbrush.com/wp-content/uploads/BookBrushImage-2021-5-11-20-5227-1024x1024.jpg",
        duration: 1200,
        releaseDate: "2023-05-10T10:00:00Z",
        score: 300.0
    )
    
    // MARK: - Sample Sections
    
    static let samplePodcastSection = HomeSection.podcasts(
        HomeSection.SectionInfo(
            name: "Top Podcasts",
            displayType: .square,
            order: 1
        ),
        [samplePodcast]
    )
    
    static let sampleEpisodeSection = HomeSection.episodes(
        HomeSection.SectionInfo(
            name: "Trending Episodes",
            displayType: .twoLinesGrid,
            order: 2
        ),
        [sampleEpisode]
    )
    
    static let sampleAudioBookSection = HomeSection.audioBooks(
        HomeSection.SectionInfo(
            name: "Bestselling Audiobooks",
            displayType: .bigSquare,
            order: 3
        ),
        [sampleAudioBook]
    )
    
    static let sampleQueueSection = HomeSection.podcasts(
        HomeSection.SectionInfo(
            name: "New Podcasts",
            displayType: .queue,
            order: 5
        ),
        [samplePodcast]
    )
    
    // MARK: - Sample Responses
    
    static let sampleHomeResponse = HomeResponse(
        sections: [
            samplePodcastSection,
            sampleEpisodeSection,
            sampleAudioBookSection
        ],
        pagination: Pagination(
            nextPage: "/home_sections?page=2",
            totalPages: 10
        )
    )
    
    static let homeResponseWithMixedSections = HomeResponse(
        sections: [
            samplePodcastSection,
            sampleEpisodeSection,
            sampleAudioBookSection,
            sampleQueueSection // queue (should be first)
        ],
        pagination: Pagination(
            nextPage: "/home_sections?page=2",
            totalPages: 5
        )
    )
    
    static let homeResponsePage2 = HomeResponse(
        sections: [
            HomeSection.audioArticles(
                HomeSection.SectionInfo(
                    name: "Must-Read Audio Articles",
                    displayType: .square,
                    order: 4
                ),
                [sampleAudioArticle]
            )
        ],
        pagination: Pagination(
            nextPage: "/home_sections?page=3",
            totalPages: 10
        )
    )
    
    static let sampleHomeResponseLastPage = HomeResponse(
        sections: [samplePodcastSection],
        pagination: Pagination(
            nextPage: nil,
            totalPages: 1
        )
    )
    
    // MARK: - Empty/Error Responses
    
    static let emptyHomeResponse = HomeResponse(
        sections: [],
        pagination: Pagination(
            nextPage: nil,
            totalPages: 1
        )
    )
    
    // MARK: - JSON Strings for Testing
    
    static let validPodcastJSON = """
    {
        "podcast_id": "12345",
        "name": "Test Podcast",
        "description": "A test podcast description",
        "avatar_url": "https://example.com/avatar.jpg",
        "episode_count": 100,
        "duration": 6000,
        "language": "en",
        "priority": 5,
        "popularityScore": 9,
        "score": 250.5
    }
    """
    
    static let invalidJSON = """
    {
        "invalid": "json"
        "missing": "comma"
    }
    """
    
    static let incompletePodcastJSON = """
    {
        "podcast_id": "12345",
        "name": "Test Podcast"
    }
    """
    
    // MARK: - Helper Methods
    
    static func createPodcast(
        id: String = "test_id",
        name: String = "Test Podcast",
        episodeCount: Int = 10,
        priority: Int = 1,
        score: Double = 100.0
    ) -> Podcast {
        return Podcast(
            podcastId: id,
            name: name,
            description: "Test description",
            avatarUrl: "https://example.com/avatar.jpg",
            episodeCount: episodeCount,
            duration: 3600,
            language: "en",
            priority: priority,
            popularityScore: 9,
            score: score
        )
    }
    
    static func createEpisode(
        id: String = "test_episode_id",
        name: String = "Test Episode",
        duration: Int = 1800,
        podcastId: String = "test_podcast_id"
    ) -> Episode {
        return Episode(
            episodeId: id,
            name: name,
            seasonNumber: 1,
            episodeType: .full,
            podcastName: "Test Podcast",
            authorName: "Test Author",
            description: "Test episode description",
            number: 1,
            duration: duration,
            avatarUrl: "https://example.com/episode.jpg",
            separatedAudioUrl: nil,
            audioUrl: "https://example.com/audio.mp3",
            releaseDate: "2024-01-01T00:00:00Z",
            podcastId: podcastId,
            chapters: [],
            podcastPopularityScore: 9,
            podcastPriority: 5,
            score: 200.0,
            paidIsEarlyAccess: false,
            paidIsNowEarlyAccess: false,
            paidIsExclusive: false,
            paidTranscriptUrl: nil,
            freeTranscriptUrl: nil,
            paidIsExclusivePartially: false,
            paidExclusiveStartTime: 0,
            paidEarlyAccessDate: nil,
            paidEarlyAccessAudioUrl: nil,
            paidExclusivityType: nil
        )
    }
    
    static func createHomeSection(
        name: String = "Test Section",
        displayType: SectionDisplayType = .square,
        order: Int = 1,
        contentType: ContentType = .podcast
    ) -> HomeSection {
        let info = HomeSection.SectionInfo(
            name: name,
            displayType: displayType,
            order: order
        )
        
        switch contentType {
        case .podcast:
            return .podcasts(info, [createPodcast()])
        case .episode:
            return .episodes(info, [createEpisode()])
        case .audioBook:
            return .audioBooks(info, [sampleAudioBook])
        case .audioArticle:
            return .audioArticles(info, [sampleAudioArticle])
        }
    }
}

// MARK: - Test Helpers

extension MockData {
    
    static func jsonData(from string: String) -> Data {
        return string.data(using: .utf8) ?? Data()
    }
    
    static func createMockResponse(statusCode: Int) -> HTTPURLResponse {
        return HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
    }
}

// MARK: - ContentItem Test Helpers

extension MockData {
    
    static var contentItems: [any ContentItem] {
        return [
            samplePodcast,
            sampleEpisode,
            sampleAudioBook,
            sampleAudioArticle,
            sampleEpisode
        ]
    }
}
