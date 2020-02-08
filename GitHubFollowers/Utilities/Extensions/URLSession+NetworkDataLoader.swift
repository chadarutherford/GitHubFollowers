//
//  URLSession+NetworkDataLoader.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/7/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import Foundation

extension URLSession: NetworkLoader {
    func loadData(using url: URL, completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        dataTask(with: url) { data, response, error in
            completion(data, response as? HTTPURLResponse, error)
        }.resume()
    }
}
