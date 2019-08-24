//
//  Search.swift
//  NetguruCollegeApp
//

import Foundation

protocol SearchDelegate: AnyObject {
    func repoFound(data: Data?)
    func userFound(data: Data?)
}

class Search {
    private let apiClient = APIClient()
    func makeSearch(nameContains name: String, type: SearchRequestType) {
        if type == .projectName {
            seachProject(nameContains: name)
        } else if type == .userName {
            searchUser(nameContains: name)
        }
    }
    func seachProject(nameContains name: String) {
        let request = SearchProjectRequest()
        let convertedName = convertProjectName(name: name)
        let parameters = ["q": convertedName,
                          "order": "desc"]
        request.parameters = parameters
        apiClient.sendRequest(request: request,
                              success: { data in
            print("success")
        }) { error in
            if error != nil {
                print(error!)
            } else {
                print("Search repo error. NIL in responce.")
            }
        }
    }
    func searchUser(nameContains name: String) {
        let request = SearchUserRequest()
        let convertedUsername = convertUserName(name: name)
        request.parameters = ["q": convertedUsername,
                              "order": "desc"]
        apiClient.sendRequest(request: request,
                              success: { data in
            print("success searching user")
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
