//
//  TotalDataCard.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/26/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "err"
    var name: String = "confirmed"
    var color:Color = .primary
    
    var body: some View {
        
        GeometryReader{geometry in
            VStack{
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                Text(self.name)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8.0)
        }//end of Geometry
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
