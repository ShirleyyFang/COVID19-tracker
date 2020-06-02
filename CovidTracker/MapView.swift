//
//  MapView.swift
//  CovidTracker
//
//  Created by Yanbing Fang on 5/28/20.
//  Copyright © 2020 Yanbing. All rights reserved.


import SwiftUI
import UIKit
import MapKit

struct MapView:UIViewRepresentable { //for UIKit support inside the SwiftUI

    @Binding var CountryMapData:[MapData]

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        print(CountryMapData.count)
        var allAnnotations:[CoronaCaseAnnotation] = []

        for data in CountryMapData {
            
            let title = data.country + "\n confirmed " + data.confirmed.formatNumber() + "\n Death " + data.deaths.formatNumber()

            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)

            allAnnotations.append(CoronaCaseAnnotation(title:title,coordinate: coordinate))
        }

        view.annotations.forEach {view.removeAnnotation($0)}
        view.addAnnotations(allAnnotations)
    }

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }


}

class CoronaCaseAnnotation: NSObject,MKAnnotation{

    let title: String?
    let coordinate:CLLocationCoordinate2D

    init(title: String?,coordinate:CLLocationCoordinate2D){
        self.title = title
        self.coordinate = coordinate
    }
}

