//
//  QueueCardView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//
import SwiftUI

struct QueueCardView: View {
    let items: [any ContentItem]
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            ZStack {
                ForEach(0..<min(4, items.count), id: \.self) { index in
                    AsyncImage(url: URL(string: getImageURL(for: items[index]))) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                    }
                    .frame(width: 120, height: 120)
                    .cornerRadius(12)
                    .offset(x: CGFloat(index * -5), y: CGFloat(index * 2))
                    .zIndex(Double(10 - index))
                }
            }
            .frame(width: 150, height: 150)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(getTitle(for: items.first))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .padding(.top, 8)
                
                Spacer()
            }
            
            Spacer()
            
            VStack {
                Spacer()
                Button(action: {}) {
                    Circle()
                        .fill(Color.primary)
                        .frame(width: 44, height: 44)
                        .overlay(
                            Image(systemName: "play.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                        )
                }
                .padding([.bottom, .trailing], 8)
            }

        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6).opacity(0.8))
        )
        .frame(height: 150)
    }
    
    private func getImageURL(for item: (any ContentItem)?) -> String {
        guard let item = item else { return "" }
        return item.avatarUrl
    }
    
    private func getTitle(for item: (any ContentItem)?) -> String {
        guard let item = item else { return "" }
        return item.name
    }
}
