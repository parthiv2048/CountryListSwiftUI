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
    
    enum CodingKeys: String, CodingKey {
        case code, name, symbol
    }
}

struct LanguageData: Decodable {
    var code: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case code, name
    }
}

struct CountryData: Decodable {
    var capital: String?
    var code: String?
    var currency: CurrencyData?
    var flag: String?
    var language: LanguageData?
    var name: String?
    var region: String?
    
    enum CodingKeys: String, CodingKey {
        case capital, code, currency, flag, language, name, region
    }
}
