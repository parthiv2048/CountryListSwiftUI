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
                ForEach(0..<(countryListVM?.numberOfCountries() ?? 0), id: \.self) { index in
                    CountryView(country: countryListVM?.countryAt(index: index))
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

struct CountryView: View {
    var country: CountryData?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .top) {
                Text("\(country?.name ?? ""), \(country?.region ?? "")")
                    .fontWeight(.semibold)
                Spacer()
                Text(country?.code ?? "")
                    .foregroundColor(.blue)
            }
            Text(country?.capital ?? "")
        }
    }
}
