//
//  Repository.swift
//  NetguruCollegeApp
//

import Foundation

struct Repository {
    var fullName: String
    var name: String
    var description: String?
    var language: String
    var owner: String
    var lastUpdateOn: Date
    init(fullName: String, name: String, description: String, language: String, lastUpdateOn: Date, owner: String) {
        self.fullName = fullName
        self.name = name
        self.owner = owner
        self.description = description
        self.language = language
        self.lastUpdateOn = lastUpdateOn
    }
}
