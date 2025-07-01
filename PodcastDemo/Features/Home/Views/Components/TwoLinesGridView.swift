//
//  TwoLinesGridView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//
import SwiftUI

struct TwoLinesGridView: View {
    let items: [any ContentItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 5) {
                ForEach(0..<items.count, id: \.self) { index in
                    TwoLinesGridItemView(item: items[index])
                }
            }
            .padding(.horizontal, 5)
        }
        .frame(height: 240)
    }
}

struct TwoLinesGridItemView: View {
    let item: any ContentItem
    private var cardWidth: CGFloat { 280 }
    private var cardHeight: CGFloat { 140 }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            AsyncImage(url: URL(string: item.avatarUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.releaseDate)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(item.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 4)
                
                HStack(spacing: 12) {
                    Button(action: {}) {
                        HStack(spacing: 4) {
                            Image(systemName: "play.fill")
                                .font(.system(size: 12))
                            Text(item.duration.toHoursAndMinutes)
                                .font(.caption)
                                .fontWeight(.medium)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(16)
                    }
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: cardWidth, height: cardHeight)
        .padding(12)
        .cornerRadius(12)
    }
}

// MARK: - Preview
#Preview {
    let sampleEpisode = Episode(
        episodeId: "1",
        name: "Podcast Episode",
        seasonNumber: 1,
        episodeType: .full,
        podcastName: "Sample Podcast",
        authorName: "Author",
        description: "Description",
        number: 1,
        duration: 30,
        avatarUrl: "https://example.com/image.jpg",
        separatedAudioUrl: nil,
        audioUrl: "https://example.com/audio.mp3",
        releaseDate: "2024-01-01",
        podcastId: "1",
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
    
    ScrollView {
        VStack(spacing: 20) {
            TwoLinesGridView(items: [sampleEpisode, sampleEpisode, sampleEpisode, sampleEpisode])
        }
        .padding()
    }
    .background(Color.black)
}
