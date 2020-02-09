//
//  User.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/7/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarURL: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlURL: String
    let following: Int
    let followers: Int
    let createdAt: String
    
    enum UserKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case name
        case location
        case bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case htmlURL = "html_url"
        case following
        case followers
        case createdAt = "created_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserKeys.self)
        login = try container.decode(String.self, forKey: .login)
        avatarURL = try container.decode(String.self, forKey: .avatarURL)
        name = try container.decode(String?.self, forKey: .name)
        location = try container.decode(String?.self, forKey: .location)
        bio = try container.decode(String?.self, forKey: .bio)
        publicRepos = try container.decode(Int.self, forKey: .publicRepos)
        publicGists = try container.decode(Int.self, forKey: .publicGists)
        htmlURL = try container.decode(String.self, forKey: .htmlURL)
        following = try container.decode(Int.self, forKey: .following)
        followers = try container.decode(Int.self, forKey: .followers)
        createdAt = try container.decode(String.self, forKey: .createdAt)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UserKeys.self)
        try container.encode(login, forKey: .login)
        try container.encode(avatarURL, forKey: .avatarURL)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(bio, forKey: .bio)
        try container.encode(publicRepos, forKey: .publicRepos)
        try container.encode(publicGists, forKey: .publicGists)
        try container.encode(htmlURL, forKey: .htmlURL)
        try container.encode(following, forKey: .following)
        try container.encode(followers, forKey: .followers)
        try container.encode(createdAt, forKey: .createdAt)
    }
}
