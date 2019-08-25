//
//  UserManager.swift
//  NetguruCollegeApp
//

import Foundation

final class UserManager {
    private var underlyingOauthtoken: String?
    var isLogged: Bool {
        return oauthToken != nil
    }
    var avatarUrl: String?
    var oauthToken: String? {
        get {
            if let token = underlyingOauthtoken {
                return token
            }
            if let token: String = KeychainManager.get(from: .tokenId) {
                underlyingOauthtoken = token
                setAvatarUrl()
                return token
            }
            return nil
        }

        set {
            KeychainManager.store(newValue, for: .tokenId)
        }
    }

    private func fetchUserAvatar() {
        guard let token = oauthToken else { return }
        let client = APIClient()
        let request = AuthenticatedUserRequest(token: token)
        client.sendRequestAndDecode(request: request, success: { [weak self ](user: AuthenticatedUser) in
            guard let self = self else { return }
            self.avatarUrl = user.avatarUrl
        }) { (_) in
            self.avatarUrl = nil
        }
    }
    
    private func setAvatarUrl() {
        if let urlString: String = KeychainManager.get(from: .avatarUrl) {
            avatarUrl = urlString
        } else {
            fetchUserAvatar()
        }
    }
    
    func loggout() {
        KeychainManager.delete(with: .tokenId)
        KeychainManager.delete(with: .avatarUrl)
        oauthToken = nil
        underlyingOauthtoken = nil
        avatarUrl = nil
    }
}
