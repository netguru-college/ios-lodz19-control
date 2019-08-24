//
//  Authorization.swift
//  NetguruCollegeApp
//

import Foundation
import OAuthSwift

final class Authorization {
    var oauth: OAuth2Swift?
    
    func authorize(completion: @escaping (String?, Error?) -> Void) {
        oauth = OAuth2Swift(
            consumerKey: AuthorizationStrings.clientID,
            consumerSecret: AuthorizationStrings.clientSecret,
            authorizeUrl: AuthorizationStrings.authorizeURL,
            accessTokenUrl: AuthorizationStrings.accessTokenURL,
            responseType: AuthorizationStrings.token
        )
        
        oauth?.authorize(
            withCallbackURL: URL(string: AuthorizationStrings.callback)!, scope: "repo+user", state: "Github") { result in
                switch result {
                case .success(let (credential, _, _)):
                    completion(credential.oauthToken, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
}
