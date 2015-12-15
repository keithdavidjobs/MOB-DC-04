//
//  Pizza.swift
//  Maps and Locations
//
//  Created by Shalev on 11/30/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import Foundation
import MapKit

class Pizza: NSObject, MKAnnotation
{
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
//    let pizzaPlace1 = MKPointAnnotation()
//    pizzaPlace1.title = m1.name
//    pizzaPlace1.subtitle = m1.phoneNumber
//    pizzaPlace1.coordinate = loc

    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}