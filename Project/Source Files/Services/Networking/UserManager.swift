//
//  UserManager.swift
//  NetguruCollegeApp
//

import Foundation

final class UserManager {
    let client = APIClient()
    
    var isLogged: Bool {
        return oauthToken != nil
    }
    var avatarUrl: String?
    var oauthToken: String? {
        didSet {
            KeychainManager.store(oauthToken, for: .tokenId)
            setAvatarUrl()
        }
    }
    
    init() {
        if let token: String = KeychainManager.get(from: .tokenId) {
            oauthToken = token
            setAvatarUrl()
        }
    }

    private func fetchUserAvatar() {
        guard let token = oauthToken else { return }
        let request = AuthenticatedUserRequest(token: token)
        client.sendRequestAndDecode(request: request, success: { [weak self ](user: AuthenticatedUser) in
            guard let self = self else { return }
            self.avatarUrl = user.avatarUrl
            KeychainManager.store(self.avatarUrl!, for: .avatarUrl)
        }) { error in
            self.avatarUrl = nil
            print(error)
        }
    }
    
    func setAvatarUrl() {
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
        avatarUrl = nil
    }
}
