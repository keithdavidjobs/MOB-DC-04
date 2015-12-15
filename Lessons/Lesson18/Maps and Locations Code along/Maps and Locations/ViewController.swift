//
//  ViewController.swift
//  Maps and Locations
//
//  Created by Tedi Konda on 11/30/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AddressBookUI

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    
    let locman = CLLocationManager()
    
    let searchRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.mapType = MKMapType.Standard
        
        let initialLocation = CLLocation(latitude: 38.904854, longitude: -77.033812)
        
        centerOnLocation(initialLocation)
        
        self.map.delegate = self
        
        self.locman.delegate = self
        self.locman.desiredAccuracy = kCLLocationAccuracyBest
        self.locman.activityType = .Fitness
        self.locman.startUpdatingLocation()
        
    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("Updated location")
        let loc = locations.last! as CLLocation
        let coord = loc.coordinate
//        print("You are at \(coord.latitude), \(coord.longitude)")
//        self.locman.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed: \(error)")
        self.locman.stopUpdatingLocation()
    }
    
    func centerOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.searchRadius * 2.0, self.searchRadius * 2.0)
        self.map.setRegion(coordinateRegion, animated: true)
    }
    
    func determineStatus() -> Bool {
        let ok = CLLocationManager.locationServicesEnabled()
        if !ok {
            return true // this is that we try to use it anyway - system will ask user to turn on location services
        }
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case CLAuthorizationStatus.AuthorizedAlways, .AuthorizedWhenInUse:
            return true
        case .NotDetermined:
            self.locman.requestWhenInUseAuthorization()
            return true
        case .Restricted:
            return false
        case .Denied:
            return false
        }
    }
    
    
    @IBAction func showCurrentLocation(sender: AnyObject) {
        self.locman.requestWhenInUseAuthorization()
        
        self.map.userTrackingMode = MKUserTrackingMode.Follow
    }
    
    
    @IBAction func getUserAddress(sender: AnyObject) {
        let loc = self.map.userLocation.location
        if loc == nil {
            print("I have no idea where the heck you are!")
            return
        }
        
        let geo = CLGeocoder()
        geo.reverseGeocodeLocation(loc!) { (placemarks, errors) -> Void in
            if placemarks != nil {
                let p = placemarks![0] as! CLPlacemark
                let address = ABCreateStringWithAddressDictionary(p.addressDictionary!, false)
                print("You are at:\n\(address)")
            }
        }
    }
    
    
    @IBAction func findFood(sender: AnyObject) {
        if !determineStatus() {
            print("You haven't authorized locations or loc services are off")
            return
        }
        
        let loc = self.map.userLocation.location
        if loc == nil {
            print("I don't know where you are right now")
            return
        }
        
        let req = MKLocalSearchRequest()
        req.region = self.map.region
        req.naturalLanguageQuery = "pizza"
        let search = MKLocalSearch(request: req)
        search.startWithCompletionHandler { (response, error) -> Void in
            if response == nil {
                print(error)
                return
            }
            self.map.showsUserLocation = false
            let m1 = response!.mapItems[0] as MKMapItem
            let place = m1.placemark
            let loc = place.location!.coordinate
            
            let pizzaPlace1 = MKPointAnnotation()
            pizzaPlace1.title = m1.name
            pizzaPlace1.subtitle = m1.phoneNumber
            pizzaPlace1.coordinate = loc
            
            self.map.addAnnotation(pizzaPlace1)
            
            let pizzaPlace2 = Pizza(title: "Mario's pizza", subTitle: "703-555-5555", coordinate: (response!.mapItems[1] as MKMapItem).placemark.location!.coordinate)
            
            self.map.addAnnotation(pizzaPlace2)
            
        }
        
    }

    @IBAction func openInMaps(sender: AnyObject) {
        let mi = MKMapItem.mapItemForCurrentLocation()
        mi.openInMapsWithLaunchOptions([
            MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue
        ])
    }
    
    
    @IBAction func getDirections(sender: AnyObject) {
        if !determineStatus() {
            print("You haven't authorized locations or loc services are off")
            return
        }
        
        let loc = self.map.userLocation.location
        if loc == nil {
            print("I don't know where you are right now")
            return
        }
        
        let req = MKLocalSearchRequest()
        req.region = self.map.region
        req.naturalLanguageQuery = "pizza"
        let search = MKLocalSearch(request: req)
        search.startWithCompletionHandler { (response, error) -> Void in
            if response == nil {
                print(error)
                return
            }
            self.map.showsUserLocation = true
            let m1 = response!.mapItems[0] as MKMapItem
            
            let dirReq = MKDirectionsRequest()
            dirReq.source = MKMapItem.mapItemForCurrentLocation()
            dirReq.destination = m1
            
            let directions = MKDirections(request: dirReq)
            directions.calculateDirectionsWithCompletionHandler({ (response, error) -> Void in
                if response == nil {
                    print(error)
                    return
                }
                
                print("Got directions")
                
                let route = response!.routes[0] // Feeling lucky (geting first route)
                let poly = route.polyline
//                self.map.addOverlay(poly)
                self.map.addOverlay(poly, level: MKOverlayLevel.AboveRoads)
                
                for step in route.steps {
                    print("After \(step.distance) meters \(step.instructions)")
                }
            })
        }
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        var v : MKPolylineRenderer! = nil
        if let overlay = overlay as? MKPolyline {
            v = MKPolylineRenderer(polyline:overlay)
            v.strokeColor = UIColor.blueColor().colorWithAlphaComponent(0.8)
            v.lineWidth = 2
        }
        return v
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

