//
//  UserManager.swift
//  NetguruCollegeApp
//

import Foundation

final class UserManager {
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
    var isLogged = false
}
