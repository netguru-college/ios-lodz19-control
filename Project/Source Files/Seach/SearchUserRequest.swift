//
//  SearchUserRequest.swift
//  NetguruCollegeApp
//

import Foundation

final class SearchUserRequest: APIRequest {
    var path: String = "/search/users"
    var method: APIMethod = .get
    var parameters: [String: String]?
    
    init(withParameters parameters: [String: String]) {
        self.parameters = parameters
    }
}
