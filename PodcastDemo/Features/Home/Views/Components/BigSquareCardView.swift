//
//  BigSquareCardView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//
import SwiftUI

struct BigSquareCardView: View {
    let items: [any ContentItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<items.count, id: \.self) { index in
                    BigSquareItemView(item: items[index])
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct BigSquareItemView: View {
    let item: any ContentItem
    
    private var cardWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let padding: CGFloat = 50
        return screenWidth - padding
    }
    
    private var cardHeight: CGFloat {
        200
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: item.avatarUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            .frame(width: cardWidth, height: cardHeight)
            .clipped()
            
            LinearGradient(
                colors: [
                    Color.black.opacity(0.1),
                    Color.black.opacity(0.7)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack {
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(item.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Text(item.duration.toHoursAndMinutes)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                            .lineLimit(1)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                .padding(.horizontal, 12)
            }
        }
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

// MARK: - Preview
#Preview {
    let samplePodcast = Podcast(
        podcastId: "1",
        name: "البودكاست العربي",
        description: "وصف البودكاست",
        avatarUrl: "https://example.com/image.jpg",
        episodeCount: 120,
        duration: 3600,
        language: "ar",
        priority: 1,
        popularityScore: 95,
        score: 280.5
    )
    
    ScrollView {
        VStack(spacing: 20) {
            BigSquareCardView(items: [samplePodcast, samplePodcast, samplePodcast, samplePodcast])
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}
