//
//  NetworkManager.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/23/26.
//

import SwiftUI

protocol NetworkManagerProtocol {
    func fetchCountries(url: String) async -> [CountryData]
}

class NetworkManager: NetworkManagerProtocol {
    /// Use Singleton pattern to provide shared global access to NetworkManager
    static let shared = NetworkManager()
    
    init() {}
    
    // MARK: Fetch Countries from Server
    
    func fetchCountries(url: String) async -> [CountryData] {
        guard let serverURL = URL(string: url) else {
            print("Log: Invalid URL")
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: serverURL)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Log: Server return error with code: \(httpResponse.statusCode)")
                return []
            }
            let countryList = try? JSONDecoder().decode([CountryData].self, from: data)
            return countryList ?? []
        } catch {
            print("Log: Error running Network code: \(error)")
            return []
        }
    }
}
