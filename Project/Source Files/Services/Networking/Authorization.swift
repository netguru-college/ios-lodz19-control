//
//  Authorization.swift
//  NetguruCollegeApp
//

import Foundation
import OAuthSwift

class Authorization {
    var oauth: OAuth2Swift?
    
    func authorize(completion: @escaping (String?, Error?) -> Void) {
        oauth = OAuth2Swift(
            consumerKey: AuthorizationStrings.clientID,
            consumerSecret: AuthorizationStrings.clientSecret,
            authorizeUrl: AuthorizationStrings.authorizeURL,
            accessTokenUrl: AuthorizationStrings.accessTokenURL,
            responseType: AuthorizationStrings.token)
        
        oauth?.authorize(
            withCallbackURL: URL(string: AuthorizationStrings.callback)!, scope: "repo+user", state: "Github") { result in
                switch result {
                case .success(let (credential, _, _)):
                    print("Oauth token: \(credential.oauthToken)")
                    completion(credential.oauthToken, nil)
                // Do your request
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil, error)
            }
        }
    }
}
