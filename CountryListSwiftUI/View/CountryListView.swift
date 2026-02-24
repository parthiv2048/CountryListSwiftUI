//
//  ContentView.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/23/26.
//

import SwiftUI

struct CountryListView: View {
    
    private var countryListVM: CountryListViewModelProtocol?
    @State private var searchText: String = ""
    
    init(countryListVM: CountryListViewModelProtocol? = nil) {
        self.countryListVM = countryListVM
    }
    
    var body: some View {
        NavigationStack {
            Text(LabelText.header.rawValue)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(countryListVM?.getCountries() ?? []) { country in
                    CountryRowView(country: country)
                }
            }
            .searchable(text: $searchText, prompt: LabelText.searchPlaceholder.rawValue)
            .onChange(of: searchText) { _, newValue in
                countryListVM?.filterCountries(searchText: newValue)
            }
            /// Hide Navigation Bar because otherwise the view moves around when using search bar
            .navigationBarHidden(true)
        }
        .task {
            await countryListVM?.fetchCountries()
        }
    }
}
