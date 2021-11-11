//
//  Follower.swift
//  GHFollowers
//
//  Created by Riccardo on 14/01/21.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}

typealias Followers = [Follower]
