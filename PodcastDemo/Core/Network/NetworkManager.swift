//
//  NetworkManager.swift
//  PodcastDemo
//
//  Created by Nawaf  on 30/06/2025.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let session: URLSession
    
    private init() {
        self.session = URLSession.shared
    }
    
    func fetch<T: Codable>(_ type: T.Type, from url: URL) async throws -> T {
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.networkError(URLError(.badServerResponse))
            }
            
            guard 200...299 ~= httpResponse.statusCode else {
                throw NetworkError.serverError(httpResponse.statusCode)
            }
            
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                print(error)
                throw NetworkError.decodingError
            }
            
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.networkError(error)
        }
    }
}
