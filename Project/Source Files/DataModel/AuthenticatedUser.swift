//
//  AuthenticatedUser.swift
//  NetguruCollegeApp
//


import Foundation

struct AuthenticatedUser: Codable {
    var avatarUrl: String
    var gravatarId: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
    }
}
