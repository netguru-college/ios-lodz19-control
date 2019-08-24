//
//  Search.swift
//  NetguruCollegeApp
//

import Foundation

protocol SearchDelegate: AnyObject {
    func receivedRepositories(repoArray: [Repository])
    func reseivedUsers(repoArray: [User])
    func gotWrongResponce()
    
}

final class Search {
    let parser = ResponceParser()
    public weak var delegate: SearchDelegate?
    private let apiClient = APIClient()
    /// Creates search request to API and sends it.
    ///
    /// - Parameters:
    ///   - name: String (name of user or repo)
    ///   - type: SearchRequestType (has values .projectName or .userName)
    /// - Returns:
    ///     reseivedRepositories(repoArray: [Repository]), where repoArray can be empty or gotWrongResponce() if responce can't be processed
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
            do {
                let repositories = try self.parser.repoFound(data: data)
                self.delegate?.reseivedRepositories(repoArray: repositories)
            } catch {
                self.delegate?.gotWrongResponce()
            }
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
            self.parser.userFound(data: data)
        }) { error in
            if error != nil {
                print(error!)
            } else {
                print("Search user error. NIL in responce.")
            }
        }
    }
    
    private func convertProjectName(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "+")
    }
    
    private func convertUserName(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "")
    }
}
