//
//  CovidFetchRequest.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/26/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject{
    
    @Published var allCountries:[CountryData] = []
    @Published var mapData:[MapData] = []
    @Published var totalData:TotalData = testTotalData
    
    init() {
        getCurrentTotal()
        getAllCountries()
    }
    
    func getCurrentTotal(){
        AF.request("https://api.covid19api.com/summary").responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                let json = JSON(result!) //use swiftyJSON
                let confirmed = json["Global"]["TotalConfirmed"].intValue
                let deaths = json["Global"]["TotalDeaths"].intValue
                let recovered = json["Global"]["TotalRecovered"].intValue
                let newConfirmed = json["Global"]["NewConfirmed"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, newConfirmed: newConfirmed, deaths: deaths, recovered: recovered)
            }else {
                self.totalData = testTotalData
            }
        }
    }
    
    func getCoordinates(countryCode:String,country:String,confirmed:Int64,deaths:Int64){
        var lat = 0.0
        var long = 0.0
        AF.request("https://api.ipgeolocationapi.com/countries/\(countryCode ?? "AF")").responseJSON{response in
            let geoResult = response.value
            if geoResult != nil{
                let geoDict = geoResult as! Dictionary<String,AnyObject>
                if geoDict["geo"] != nil{
                    lat = geoDict["geo"]!["latitude"]!! as! Double
                    long = geoDict["geo"]!["longitude"]!! as! Double
                    let MapObject = MapData(country: country, confirmed: confirmed,deaths: deaths,longitude:long, latitude:lat )
                    self.mapData.append(MapObject)
                }
            }
        }
    }
    
    func getAllCountries(){
        AF.request("https://api.covid19api.com/summary").responseJSON { response in
            
            let result = response.value
            var allCount:[CountryData] = []
            if result != nil{
                let dataDict = result as! Dictionary<String,Any>
                let countryDict = dataDict["Countries"] as! [Dictionary<String,AnyObject>]
                for countryData in countryDict{
                    let country = countryData["Country"] as? String
                    let recovered = countryData["TotalRecovered"] as? Int64
                    let confirmed = countryData["TotalConfirmed"] as? Int64
                    let newConfirmed = countryData["NewConfirmed"] as? Int64
                    let deaths = countryData["TotalDeaths"] as? Int64
                    let countryCode = countryData["CountryCode"] as? String
                    
                    let CountryObject = CountryData(country: country ?? "Error", confirmed: confirmed ?? 0, newConfirmed: newConfirmed ?? 0, deaths: deaths ?? 0, recovered: recovered ?? 0)
                    allCount.append(CountryObject)
                    
                    let coordinate = self.getCoordinates(countryCode: countryCode!,country:country ?? "Error",confirmed:confirmed ?? 0,deaths:deaths ?? 0)
              }
            }//allCount.count = 186
            self.allCountries = allCount.sorted(by: {$0.confirmed > $1.confirmed})
        }
    }
}
    
