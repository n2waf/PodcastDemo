//
//  ContentItemView.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import SwiftUI

struct ContentItemView: View {
    let imageURL: String
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: 120, height: 120)
            .cornerRadius(8)
            
            Text(title)
                .font(.caption)
                .lineLimit(2)
                .frame(width: 120, alignment: .leading)
        }
    }
}
