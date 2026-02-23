//
//  CountryListViewModel.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/23/26.
//

import SwiftUI

protocol CountryListViewModelProtocol {
    func fetchCountries() async
    func numberOfCountries() -> Int
    func countryAt(index: Int) -> CountryData?
    func filterCountries(searchText: String)
}

@Observable
class CountryListVM: CountryListViewModelProtocol {
    private var countryList: [CountryData]?
    private var filteredCountryList: [CountryData]?
    
    init(countryList: [CountryData]? = []) {
        self.countryList = countryList
        self.filteredCountryList = countryList
    }
    
    // MARK: Fetch Countries using Network Manager
    
    func fetchCountries() async {
        countryList = await NetworkManager.fetchCountries(url: Server.countryListURL.rawValue)
        filteredCountryList = countryList
    }
    
    func numberOfCountries() -> Int {
        return filteredCountryList?.count ?? 0
    }
    
    func countryAt(index: Int) -> CountryData? {
        if let filteredCountryList = filteredCountryList, index >= filteredCountryList.count {
            return nil
        }
        return filteredCountryList?[index]
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

