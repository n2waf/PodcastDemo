//
//  SquareCardView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//
import SwiftUI

struct SquareCardView: View {
    let imageURL: String
    let title: String
    let subtitle: String
//    let duration: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                }
                .frame(width: 160, height: 160)
                .cornerRadius(16)
                .clipped()
                
                VStack {
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .padding(8)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                        
                        Spacer()
                    }
                    Spacer()
                }
                .padding(12)
                
                // Duration badge at bottom
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Text(duration)
//                            .font(.caption)
//                            .fontWeight(.medium)
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 8)
//                            .padding(.vertical, 4)
//                            .background(Color.black.opacity(0.7))
//                            .cornerRadius(8)
//                    }
//                }
//                .padding(12)
            }
            
            // Title and subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .frame(width: 160)
    }
}
