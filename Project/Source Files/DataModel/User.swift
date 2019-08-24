//
//  User.swift
//  NetguruCollegeApp
//


import Foundation

class User {
    private var id : Int
    private var userName : String
    private var avatar_url : String
    private var url : String
    private var repositoriesNumber : Int
    private var repositories : [Repository]

    init(id : Int, userName: String, avatar_url : String, url : String, repositoriesNumber: Int) {
        self.id = id
        self.userName = userName
        self.avatar_url = avatar_url
        self.url = url
        self.repositoriesNumber = repositoriesNumber
        self.repositories = []
    }
}
