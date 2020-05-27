//
//  CountryDataRow.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/26/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        HStack{
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 105, alignment: .leading)
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading,5)
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .frame(width: 50, height:40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading,5)
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .frame(width: 57, height:40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.green)
        }
    }
}

struct CountryDataRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
