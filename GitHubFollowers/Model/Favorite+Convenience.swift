//
//  Favorite+Convenience.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/10/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import CoreData
import Foundation

extension Favorite {
    @discardableResult convenience init?(name: String, avatarURL: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.avatarURL = avatarURL
    }
    
    @discardableResult convenience init?(follower: Follower, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(name: follower.login, avatarURL: follower.avatarURL, context: context)
    }
}
