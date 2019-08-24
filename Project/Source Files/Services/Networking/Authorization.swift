//
//  Authorization.swift
//  NetguruCollegeApp
//

import Foundation
import OAuthSwift

class Authorization {
    var oauth: OAuth2Swift?
    
    func authorize() -> OAuthSwiftRequestHandle? {
        oauth = OAuth2Swift(
            consumerKey: AuthorizationStrings.clientID,
            consumerSecret: AuthorizationStrings.clientSecret,
            authorizeUrl: AuthorizationStrings.authorizeURL,
            accessTokenUrl: AuthorizationStrings.accessTokenURL,
            responseType: AuthorizationStrings.token)
        
        let handle = oauth?.authorize(
            withCallbackURL: URL(string: AuthorizationStrings.callback)!, scope: "repo+user", state: "Github") { result in
                switch result {
                case .success(let (credential, response, parameters)):
                    print("Oauth token: \(credential.oauthToken)")
                // Do your request
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        return handle
    }
}
