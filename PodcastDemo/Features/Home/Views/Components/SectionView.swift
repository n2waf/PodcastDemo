//
//  SectionView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//
import SwiftUI
struct SectionView: View {
    let section: Section
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            switch section.info.displayType {
            case .queue:
                queueSection()
            case .square:
                squareSection()
            case .bigSquare:
                bigSquareSection()
            case .twoLinesGrid:
                twoLinesGridSection()
            }
        }
    }
    
    @ViewBuilder
    func squareSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(section.info.name)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<section.items.count, id: \.self) { index in
                        SquareCardView(
                            imageURL: section.items[index].avatarUrl,
                            title: section.items[index].name,
                            subtitle: section.items[index].releaseDate)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    @ViewBuilder
    func bigSquareSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(section.info.name)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            BigSquareCardView(items: section.items)
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
    
    @ViewBuilder
    func twoLinesGridSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(section.info.name)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            TwoLinesGridView(items: section.items)
        }
    }
}
