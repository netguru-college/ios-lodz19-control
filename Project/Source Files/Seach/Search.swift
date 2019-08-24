//
//  Search.swift
//  NetguruCollegeApp
//

import Foundation

protocol SearchDelegate: AnyObject {
    func repoFound(data: Data?)
    func userFound(data: Data?)
}

final class Search {
    public var delegate : SearchDelegate?
    
    private let apiClient = APIClient()
    /// Creates search request to API and sends it.
    ///
    /// - Parameters:
    ///   - name: String (name of user or repo)
    ///   - type: SearchRequestType (has values .projectName or .userName)
    func makeSearch(nameContains name: String, type: SearchRequestType) {
        if type == .projectName {
            seachProject(nameContains: name)
        } else if type == .userName {
            searchUser(nameContains: name)
        }
    }
    
    func seachProject(nameContains name: String) {
        let convertedName = convertProjectName(name: name)
        let parameters = ["q": convertedName,
                          "order": "desc"]
        let request = SearchProjectRequest(withParameters: parameters)
        apiClient.sendRequest(request: request,
                              success: { data in
            self.delegate?.repoFound(data: data)
        }) { error in
            if error != nil {
                print(error!)
            } else {
                print("Search repo error. NIL in responce.")
            }
        }
    }
    
    func searchUser(nameContains name: String) {
        let convertedUsername = convertUserName(name: name)
        let parameters = ["q": convertedUsername,
                              "order": "desc"]
        let request = SearchUserRequest(withParameters: parameters)
        apiClient.sendRequest(request: request,
                              success: { data in
            self.delegate?.userFound(data: data)
        }) { error in
            if error != nil {
                print(error!)
            } else {
                print("Search user error. NIL in responce.")
            }
        }
    }
    
    func convertProjectName(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "+")
    }
    
    func convertUserName(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "")
    }
}
