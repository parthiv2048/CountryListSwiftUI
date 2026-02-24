//
//  CountryListSwiftUIApp.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/23/26.
//

import SwiftUI

@main
struct CountryListSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView(countryListVM: CountryListVM(networkManager: NetworkManager.shared))
        }
    }
}
