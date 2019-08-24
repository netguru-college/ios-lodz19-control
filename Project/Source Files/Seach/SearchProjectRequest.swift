//
//  SearchRequest.swift
//  NetguruCollegeApp
//

import Foundation

final class SearchProjectRequest: APIRequest {
    var path: String = "/search/repositories"
    var method: APIMethod = .get
    var parameters: [String: String]
    
    init(withParameters parameters: [String : String]) {
        self.parameters = parameters
    }
}
