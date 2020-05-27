//
//  ListHeaderView.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/26/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        
        HStack{
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, alignment: .leading)
                .padding(.leading,15)
            Spacer()
            
            Text("Confirmed")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading,5)
            Spacer()
            
            Text("Death")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading,5)
            Spacer()
            
            Text("Recover")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40, alignment: .leading)
                .padding(.leading,15)
            Spacer()
        }
        .background(Color.yellow)

    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
