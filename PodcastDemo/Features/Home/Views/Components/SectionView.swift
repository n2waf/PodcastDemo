//
//  SectionView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import SwiftUI

struct SectionView: View {
    let section: HomeSection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.info.name)
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(Array(section.items.enumerated()), id: \.offset) { index, item in
                        ContentItemView(
                            imageURL: item.avatarUrl,
                            title: item.name
                        )
                    }
                }
                .padding(.horizontal, 2)
            }
        }
    }
}
