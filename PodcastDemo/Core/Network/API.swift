//
//  APIEndpoints.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

enum API {
    case home(page: Int?)
    case search(query: String, page: Int?)
    
    private var absoluteURLString: String {
        switch self {
        case .home:
            return "https://api-v2-b2sit6oh3a-uc.a.run.app/home_sections"
        case .search:
            return "https://mock.apidog.com/m1/735111-711675-default/search"
        }
    }
    
    var url: URL? {
        switch self {
        case let .home(page):
            var components = URLComponents(string: absoluteURLString)
            if let page = page {
                components?.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
            }
            return components?.url
        case let .search(query, page):
            var components = URLComponents(string: absoluteURLString)
            components?.queryItems = [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "page", value: "\(page ?? 1)")
            ]
            return components?.url
        }
    }
    
}
