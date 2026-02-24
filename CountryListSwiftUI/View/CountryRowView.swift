//
//  CountryRowView.swift
//  CountryListSwiftUI
//
//  Created by Parthiv Ganguly on 2/24/26.
//

import SwiftUI

struct CountryRowView: View {
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
