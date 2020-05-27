//
//  TotalDataView.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/26/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData:TotalData
    
    var body: some View {
        VStack{
            HStack{
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Confirmed")
                TotalDataCard(number: totalData.newConfirmed.formatNumber(), name: "New confirmed",color: .yellow)
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Deaths",color:.red)
            }
            HStack{
                TotalDataCard(number: String(format:"%.2f",totalData.fatalityRate), name: "Death%",color:.red)
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "Recovered",color: .green)
                TotalDataCard(number: String(format:"%.2f",totalData.recoveredRate), name: "Recovery%",color:.green)
            }
        }//end of VStack
            .frame(height:170)
            .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
