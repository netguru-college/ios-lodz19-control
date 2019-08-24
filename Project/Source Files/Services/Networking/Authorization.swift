//
//  Authorization.swift
//  NetguruCollegeApp
//

import Foundation
import OAuthSwift

enum Authorization {
    static func authorize() {
        let oauthswift = OAuth2Swift(
            consumerKey: AuthorizationStrings.clientID,
            consumerSecret: AuthorizationStrings.clientSecret,
            authorizeUrl: AuthorizationStrings.authorizeURL,
            responseType: AuthorizationStrings.token
        )
        oauthswift.authorize(
            withCallbackURL: URL(string: AuthorizationStrings.callback)!, scope: "repo+user", state: "Github") { result in
                switch result {
                case .success(let (credential, response, parameters)):
                    print("Oauth token: \(credential.oauthToken)")
                // Do your request
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
