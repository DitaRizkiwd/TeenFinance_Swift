//
//  RemoteConfigService.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation
import Firebase

class RemoteConfigService: RemoteConfigurable {
    static let shared = RemoteConfigService()
    
    //variabel untuk mengatur interval fetch data ke Firebase Remote Config dari local ke code
    
    private var remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {
        configure()
    }
    
    func configure(){
        #if DEBUG
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0 // development
        #else
        settings.minimumFetchInterval = 86400 //production
        #endif
        
        remoteConfig.configSettings = settings
    }
    //fetch and activate configuration, dan simpan hasil sebagai status
    func fetchConfig<T: Decodable>(forKey key: ConfigKeys) async throws -> T {
        let status = try await remoteConfig.fetchAndActivate()
        
        switch status {
        case .successFetchedFromRemote:
            print("Configuration fetched from remote and activated")
        case .successUsingPreFetchedData:
            print("Pre-fetched data available and activated")
        case .error:
            print("An error occured while fetching remote config")
        @unknown default:
            print ("An unknown status was returned")
        }
        //validasi dari config value di firebase remote berupa String
        let stringValue = remoteConfig.configValue(forKey: key.rawValue).stringValue ?? ""
        print ("Fetched value for \(key.rawValue) : \(stringValue)")
        
        if T.self == String.self, let stringValue = stringValue as? T {
            return stringValue
        }
        //
        guard let data = stringValue.data(using: .utf8)
        else{
            throw ErrorConfiguration.failedToConvertData(key: key.rawValue)
        }
        do{
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        }
        catch{
            throw ErrorConfiguration.failedToDecodeData(key: key.rawValue, underlyingError: error)
            
        }
    }
}
enum ErrorConfiguration: Error, LocalizedError{
    case failedToDecodeData(key: String, underlyingError: Error)
    case failedToConvertData(key: String)
    
    var errorDescription: String?{
        switch self {
        case .failedToDecodeData(let key, let underlyingError):
            return "Failed to decode configuration for key: \(key). Error: \(underlyingError.localizedDescription)"
            
        case .failedToConvertData(key: let key):
            return "Failed to convert configation for key: \(key) to data"
        }
    }
}

protocol RemoteConfigurable {
    func fetchConfig<T: Decodable>(forKey key: ConfigKeys) async throws -> T
}
enum ConfigKeys: String{
    case apiKey = "API_KEY"
}
