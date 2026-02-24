//
//  CountryListViewModel.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/23/26.
//

import SwiftUI

protocol CountryListViewModelProtocol {
    func fetchCountries() async
    func getCountries() -> [CountryData]?
    func filterCountries(searchText: String)
}

@Observable
class CountryListVM: CountryListViewModelProtocol {
    
    private var networkManager: NetworkManagerProtocol?
    private var countryList: [CountryData]?
    private var filteredCountryList: [CountryData]?
    
    init(networkManager: NetworkManagerProtocol? = nil, countryList: [CountryData]? = nil) {
        self.networkManager = networkManager
        self.countryList = countryList
        self.filteredCountryList = countryList
    }
    
    // MARK: Fetch Countries using Network Manager
    
    func fetchCountries() async {
        countryList = await self.networkManager?.fetchCountries(url: Server.countryListURL.rawValue)
        filteredCountryList = countryList
    }
    
    func getCountries() -> [CountryData]? {
        return filteredCountryList
    }
    
    // MARK: Filter Countries according to search string
    
    func filterCountries(searchText: String) {
        if searchText.isEmpty {
            filteredCountryList = countryList
        } else {
            filteredCountryList = countryList?.filter { (country: CountryData) -> Bool in
                return country.name?.lowercased().contains(searchText.lowercased()) ?? false || country.capital?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
}

