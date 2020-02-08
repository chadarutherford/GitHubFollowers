//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/7/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarURL: String
    
    enum FollowerKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FollowerKeys.self)
        login = try container.decode(String.self, forKey: .login)
        avatarURL = try container.decode(String.self, forKey: .avatarURL)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FollowerKeys.self)
        try container.encode(login, forKey: .login)
        try container.encode(avatarURL, forKey: .avatarURL)
    }
}
