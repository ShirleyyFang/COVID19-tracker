//
//  MapContainerView.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/30/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        MapView(CountryMapData: $covidFetch.mapData)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
