//
//  KeychainWrapper.swift
//  NetguruCollegeApp
//

import KeychainSwift

enum KeychainManager {
    enum KeychainKey: String {
        case tokenId
        case deviceId
        case avatarUrl
    }
    
    private static let keychain = KeychainSwift()
    
    static func store<T: Codable>(_ object: T, for key: KeychainKey) {
        switch object {
        case is String:
            keychain.set(object as! String, forKey: key.rawValue)
        case is Bool:
            keychain.set(object as! Bool, forKey: key.rawValue)
        default: ()
        }
    }
    
    static func get<T: Codable>(from key: KeychainKey) -> T? {
        switch T.self {
        case is String.Type:
            return keychain.get(key.rawValue) as? T
        case is Bool.Type:
            return keychain.getBool(key.rawValue) as? T
        default:
            return nil
        }
    }
    
    static func delete(with key: KeychainKey) {
        keychain.delete(key.rawValue)
    }
    
    static func clearAll() {
        keychain.clear()
    }
}
