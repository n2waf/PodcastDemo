//
//  Episode.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

// MARK: - Episode Type Enum
enum EpisodeType: String, Decodable {
    case full
    case trailer
    case bonus
}

// MARK: - Episode
struct Episode: ContentItem {
    let episodeId: String
    let name: String
    let seasonNumber: Int?
    let episodeType: EpisodeType
    let podcastName: String
    let authorName: String?
    let description: String
    let number: Int?
    let duration: Int
    let avatarUrl: String
    let separatedAudioUrl: String?
    let audioUrl: String
    let releaseDate: String
    let podcastId: String
    let chapters: [Chapter]
    let podcastPopularityScore: Int
    let podcastPriority: Int
    let score: Double
    
    // MARK: Paid Features
    let paidIsEarlyAccess: Bool
    let paidIsNowEarlyAccess: Bool
    let paidIsExclusive: Bool
    let paidTranscriptUrl: String?
    let freeTranscriptUrl: String?
    let paidIsExclusivePartially: Bool
    let paidExclusiveStartTime: Int
    let paidEarlyAccessDate: String?
    let paidEarlyAccessAudioUrl: String?
    let paidExclusivityType: String?
    
    var id: String { episodeId }
    
    // MARK: - Chapter
    struct Chapter: Decodable {
        let title: String
        let startTime: Int
        let endTime: Int
    }
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case name
        case seasonNumber = "season_number"
        case episodeType = "episode_type"
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case description
        case number
        case duration
        case avatarUrl = "avatar_url"
        case separatedAudioUrl = "separated_audio_url"
        case audioUrl = "audio_url"
        case releaseDate = "release_date"
        case podcastId = "podcast_id"
        case chapters
        case podcastPopularityScore = "podcastPopularityScore"
        case podcastPriority = "podcastPriority"
        case score
        case paidIsEarlyAccess = "paid_is_early_access"
        case paidIsNowEarlyAccess = "paid_is_now_early_access"
        case paidIsExclusive = "paid_is_exclusive"
        case paidTranscriptUrl = "paid_transcript_url"
        case freeTranscriptUrl = "free_transcript_url"
        case paidIsExclusivePartially = "paid_is_exclusive_partially"
        case paidExclusiveStartTime = "paid_exclusive_start_time"
        case paidEarlyAccessDate = "paid_early_access_date"
        case paidEarlyAccessAudioUrl = "paid_early_access_audio_url"
        case paidExclusivityType = "paid_exclusivity_type"
    }
}
