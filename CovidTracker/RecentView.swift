//
//  RecentView.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/26/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI


struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            VStack{
                TotalDataView(totalData:covidFetch.totalData)
                ListHeaderView()
                List{
                    
                    ForEach(covidFetch.allCountries.filter{
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id:\.country){countryData in
                        CountryDataRowView(countryData: countryData)

                    }
                }
                
            }//End of VStack
        }//End of navigation view
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
