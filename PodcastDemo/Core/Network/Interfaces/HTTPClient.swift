//
//  HTTPClient.swift
//  PodcastDemo
//
//  Created by Nawaf  on 02/07/2025.
//
import Foundation

protocol HTTPClient {
    func get<T: Codable>(_ type: T.Type, from api: API) async throws -> T
}
