//
//  SearchView.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/27/20.
//  Copyright © 2020 Yanbing. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack{
            TextField("Country...",text:$searchText)
            .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
    }
}

