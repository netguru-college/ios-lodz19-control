//
//  Search.swift
//  NetguruCollegeApp
//

import Foundation

protocol SearchProviderDelegate: AnyObject {
    func receivedRepositories(repoArray: [Repository])
    func receivedUsers(repoArray: [User])
    func gotWrongResponce()
    
}

final class SearchProvider {
    let parser = ResponceParser()
    public weak var delegate: SearchProviderDelegate?
    private let apiClient = APIClient()
    /// Creates search request to API and sends it.
    ///
    /// - Parameters:
    ///   - name: String (name of user or repo)
    ///   - type: SearchRequestType (has values .projectName or .userName)
    /// - Returns:
    ///     receivedRepositories(repoArray: [Repository]), where repoArray can be empty or gotWrongResponce() if responce can't be processed
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
                self.delegate?.receivedRepositories(repoArray: repositories)
            } catch {
                self.delegate?.gotWrongResponce()
            }
        }) { error in
                self.delegate?.gotWrongResponce()
            
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
                self.delegate?.gotWrongResponce()
        }
    }
    
    private func convertProjectName(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "+")
    }
    
    private func convertUserName(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "")
    }
}
