//
//  Repository.swift
//  NetguruCollegeApp
//


import Foundation

class Repository {
    var name : String
    var description : String?
    var language : String
    var lastUpdateOn : Date
    
    init(name: String, description : String, language: String, lastUpdateOn: Date) {
        self.name = name
        self.description = description
        self.language = language
        self.lastUpdateOn = lastUpdateOn
    }
}
