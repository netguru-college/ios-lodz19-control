//
//  Repository.swift
//  NetguruCollegeApp
//

import Foundation

struct Repository {
    let name: String
    let owner: String
    let description: String?
    let language: String
    let lastUpdateOn: Date
    let avatarUrl: String?
    
    init(name: String, owner: String, description: String, language: String, lastUpdateOn: Date, avatarUrl: String?) {
        self.name = name
        self.owner = owner
        self.description = description
        self.language = language
        self.lastUpdateOn = lastUpdateOn
        self.avatarUrl = avatarUrl
    }
}
