//
//  Constants.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/23/26.
//

// MARK: Server Endpoints

enum Server: String {
    case countryListURL = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
}

// MARK: Text used in Labels

enum LabelText: String {
    case header = "Country List"
    case searchPlaceholder = "Search name and capital"
}
