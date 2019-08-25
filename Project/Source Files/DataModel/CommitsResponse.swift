//
//  CommitsResponse.swift
//  NetguruCollegeApp
//


import Foundation

struct CommitsResponse {
    let authorName: String
    let date: Date
    let message: String

    init(name: String, date: Date, message: String) {
        self.authorName = name
        self.date = date
        self.message = message
    }
}
