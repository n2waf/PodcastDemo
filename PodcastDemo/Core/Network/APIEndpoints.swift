//
//  APIEndpoints.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

struct APIEndpoints {
    static let homeSections = "https://api-v2-b2sit6oh3a-uc.a.run.app/home_sections"
    static let search = "https://mock.apidog.com/m1/735111-711675-default/search"
    
    static func homeSectionsURL(page: Int = 1) -> URL? {
        var components = URLComponents(string: homeSections)
        components?.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        return components?.url
    }
    
    static func searchURL(query: String, page: Int = 1) -> URL? {
        var components = URLComponents(string: search)
        components?.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        return components?.url
    }
}
