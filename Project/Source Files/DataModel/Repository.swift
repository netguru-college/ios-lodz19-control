//
//  Repository.swift
//  NetguruCollegeApp
//

import Foundation

struct Repository {
    let fullName: String
    let name: String
    let description: String?
    let language: String
    let owner: String
    let lastUpdateOn: Date
    let avatarUrl: String?
    init(fullName: String, name: String, description: String, language: String, lastUpdateOn: Date, owner: String, avatarUrl: String?) {
        self.fullName = fullName
        self.name = name
        self.owner = owner
        self.description = description
        self.language = language
        self.lastUpdateOn = lastUpdateOn
        self.avatarUrl = avatarUrl
    }
}
