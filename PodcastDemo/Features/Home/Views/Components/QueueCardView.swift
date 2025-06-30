//
//  QueueCardView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//
import SwiftUI

struct QueueCardView: View {
    let imageURL: String
    let title: String
    let releaseDate: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: 120, height: 120)
            .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
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
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6).opacity(0.8))
        )
        .frame(height: 150)
    }
}
#Preview {
    QueueCardView(
        imageURL: "https://media.npr.org/assets/img/2023/03/01/npr-news-now_square.png?s=1400&c=66",
        title: "The Neighborhood Listen Neighborhood Listen Neighborhood Listen Neighborhood Listen",
        releaseDate: "Before 5 Hours"
    )
    .padding()
}
