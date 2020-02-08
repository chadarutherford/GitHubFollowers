//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/7/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = URL(string: "https://api.github.com/users/")
    var networkLoader: NetworkLoader { URLSession.shared }
    let cache = NSCache<NSString, UIImage>()
    
    private init() { }
    
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], NetworkError>) -> Void) {
        guard let endpoint = baseURL?.appendingPathComponent("\(username)").appendingPathComponent("followers") else { return }
        var components = URLComponents(url: endpoint, resolvingAgainstBaseURL: true)
        let perPageItem = URLQueryItem(name: "per_page", value: "100")
        let pageItem = URLQueryItem(name: "page", value: "\(page)")
        components?.queryItems = [perPageItem, pageItem]
        guard let url = components?.url else {
            completion(.failure(.invalidUsername))
            return
        }
        networkLoader.loadData(using: url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async { completion(.failure(.unableToComplete)) }
                return
            }
            
            guard let response = response, response.statusCode == 200 else {
                DispatchQueue.main.async { completion(.failure(.invalidResponse)) }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async { completion(.failure(.invalidData)) }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let followers = try decoder.decode([Follower].self, from: data)
                DispatchQueue.main.async { completion(.success(followers)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(.invalidData)) }
            }
        }
    }
}
