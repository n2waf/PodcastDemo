//
//  SectionView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//
import SwiftUI
struct SectionView: View {
    let section: HomeSection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            switch section {
            case .podcasts:
                if section.info.displayType == .queue {
                    queueSection()
                }
            case .episodes:
                EmptyView()
            case .audioBooks:
                EmptyView()
            case .audioArticles:
                EmptyView()
            }
        }
    }
    
    @ViewBuilder
    func queueSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Queue")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(Array(section.items.enumerated()), id: \.offset) { index, item in
                        QueueCardView(
                            imageURL: item.avatarUrl,
                            title: item.name,
                            releaseDate: item.releaseDate
                        )
                        .padding()
                        .containerRelativeFrame(.horizontal)
                        .scrollTargetLayout()
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}
