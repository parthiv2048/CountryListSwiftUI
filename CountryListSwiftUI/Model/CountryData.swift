//
//  CountryData.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/23/26.
//

struct CurrencyData: Decodable {
    var code: String?
    var name: String?
    var symbol: String?
}

struct LanguageData: Decodable {
    var code: String?
    var name: String?
}

struct CountryData: Decodable {
    var capital: String?
    var code: String?
    var currency: CurrencyData?
    var flag: String?
    var language: LanguageData?
    var name: String?
    var region: String?
}
