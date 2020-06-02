//
//  model.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/26/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import Foundation

struct TotalData {
    let confirmed: Int
    let newConfirmed: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.00*Double(deaths))/Double(confirmed)
    }
    
    var recoveredRate: Double{
        return (100.00*Double(recovered))/Double(confirmed)
    }
}

struct CountryData{
    
    let country: String
    let confirmed: Int64    //handy for core data ??
    let newConfirmed: Int64
    let deaths: Int64
    let recovered: Int64
    
    
    var fatalityRate: Double {
        return (100.00*Double(deaths))/Double(confirmed)
    }
    
    var recoveredRate: Double{
        return (100.00*Double(recovered))/Double(confirmed)
    }
}

struct MapData{
    let country: String
    let confirmed: Int64
    let deaths: Int64
    let longitude: Double
    let latitude: Double
}

let testTotalData = TotalData(confirmed: 200, newConfirmed: 100, deaths: 20, recovered: 50)
let testCountryData = CountryData(country: "test", confirmed: 200, newConfirmed: 100, deaths: 20, recovered: 20)

