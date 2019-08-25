//
//  Repository.swift
//  NetguruCollegeApp
//

import Foundation

struct Repository {
    var name: String
    var description: String?
    var language: String
    var owner: String
    var lastUpdateOn: Date
    init(name: String, description: String, language: String, lastUpdateOn: Date, owner: String) {
        self.name = name
        self.description = description
        self.language = language
        self.lastUpdateOn = lastUpdateOn
        self.owner = owner
    }
}
