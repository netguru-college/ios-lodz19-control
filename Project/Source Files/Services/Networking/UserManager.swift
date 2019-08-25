//
//  UserManager.swift
//  NetguruCollegeApp
//

import Foundation

final class UserManager {
    var isLogged = false
    var avatarUrl: String?
    var oauthToken: String? {
        get {
            if let token: String = KeychainManager.get(from: .tokenId) {
                isLogged = true
                return token
            }
            return nil
        }

        set {
            if let token = oauthToken {
                KeychainManager.store(token, for: .tokenId)
                isLogged = true
            }
        }
    }
    
    func fetchUserAvatar() {
        let client = APIClient()
        let request = AuthenticatedUserRequest()
        client.sendRequestAndDecode(request: request, success: { [weak self ](user: AuthenticatedUser) in
            guard let self = self else { return }
            self.avatarUrl = user.avatarUrl
        }) { (error) in
            // add placeholder.
        }
    }
}
