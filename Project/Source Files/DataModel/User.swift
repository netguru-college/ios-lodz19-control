//
//  User.swift
//  NetguruCollegeApp
//

import Foundation

struct User {
    private var id: Int
    private var userName: String
    private var avatarURL: String
    private var url: String
    private var repositoriesNumber: Int
    private var repositories: [Repository]

    init(id: Int, userName: String, avatarURL: String, url: String, repositoriesNumber: Int) {
        self.id = id
        self.userName = userName
        self.avatarURL = avatarURL
        self.url = url
        self.repositoriesNumber = repositoriesNumber
        self.repositories = []
    }
}
