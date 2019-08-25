//
//  AuthenticatedUserRequest.swift
//  NetguruCollegeApp
//


import Foundation

final class AuthenticatedUserRequest: APIRequest {
    var path = "/user"
    var method = APIMethod.get
    var token: String
    var headers: [String: String]? {
        return ["Authorization": "token \(token)"]
    }
    
    init(token: String) {
        self.token = token
    }
}
