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
            HStack {
                Text("Queue")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)
                Spacer()
                Text("\(section.itemCount) Episodes")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            QueueCardView(items: section.items)
        }
    }
}
