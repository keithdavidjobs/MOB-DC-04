//
//  Pizza.swift
//  Maps and Locations
//
//  Created by Tedi Konda on 11/30/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import MapKit

class Pizza: NSObject, MKAnnotation {
    let title: String?
    let subTitle: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subTitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subTitle = subTitle
        self.coordinate = coordinate
        
        super.init()
    }
}
