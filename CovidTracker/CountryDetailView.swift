//
//  CountryDetailView.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/27/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryData: CountryData
    
    var body: some View {
        VStack{
            VStack{
                CountryDetailRow(number: countryData.confirmed.formatNumber(), name: "Confirmed")
                CountryDetailRow(number: countryData.newConfirmed.formatNumber(), name: "New confirmed",color: .yellow)
                CountryDetailRow(number: countryData.deaths.formatNumber(), name: "Deaths", color: .red)
                CountryDetailRow(number: countryData.recovered.formatNumber(), name: "Recovered", color: .green)
                CountryDetailRow(number: String(format:"%.2f",countryData.fatalityRate), name: "Death%", color: .red)
                CountryDetailRow(number: String(format:"%.2f",countryData.recoveredRate), name: "Recovered%", color: .green)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top,50)
        .navigationBarTitle(countryData.country)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
