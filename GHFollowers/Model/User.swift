// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)

import Foundation

// MARK: - User
struct User: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let name: String?
    let location: String?
    let company: String?
    let email: String?
    let bio: String?
    let publicRepos, publicGists, followers, following: Int
    let createdAt: String
}
