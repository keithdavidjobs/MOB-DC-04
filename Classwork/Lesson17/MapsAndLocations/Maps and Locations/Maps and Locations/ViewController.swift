//
//  ViewController.swift
//  Maps and Locations
//
//  Created by Shalev on 11/30/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AddressBookUI

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var map: MKMapView!
    
    //By default we work in meters
    let searchRadius: CLLocationDistance = 1000
    let locMan = CLLocationManager()
    var x = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap = UITapGestureRecognizer(target: self, action: "doubleT")
        tap.numberOfTapsRequired = 2
        self.map.addGestureRecognizer(tap)
        
        self.map.mapType = MKMapType.Standard
        
        let initialLocation = CLLocation(latitude: 38.898830, longitude: -77.032384)
        
        centerOnLocation(initialLocation)
        
        self.map.delegate = self
        self.locMan.delegate = self
        
        self.locMan.desiredAccuracy = kCLLocationAccuracyBest
        self.locMan.activityType = .Fitness
        self.locMan.startUpdatingLocation()
    }
    
    func determineStatus() -> Bool
    {
        let ok = CLLocationManager.locationServicesEnabled()
        if !ok
        {
            return true
        }
        
        let status = CLLocationManager.authorizationStatus()
        switch status
        {
            case .AuthorizedWhenInUse, .AuthorizedAlways:
                return true
            case .NotDetermined:
                self.locMan.requestWhenInUseAuthorization()
                return true
            case .Restricted:
                return false
            case .Denied:
                return false
        }
        return false
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print("\(x): update location")
        x++
        let loc = locations.last! as CLLocation
        let coords = loc.coordinate
        //print("You are at \(coords.latitude), \(coords.longitude)")
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed: \(error)")
        self.locMan.stopUpdatingLocation()
    }
    
    func centerOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.searchRadius * 2, self.searchRadius * 2)
        self.map.setRegion(coordinateRegion, animated: true)
    }
    
    func doubleT()
    {
        print("double tap")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }

    @IBAction func showCurrentLocation(sender: AnyObject) {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse
        {
            let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
            UIApplication.sharedApplication().openURL(settingsUrl!)
        }
        else
        {
            self.locMan.requestWhenInUseAuthorization()
            self.map.userTrackingMode = .Follow
        }
    }

    @IBAction func stopShowingCurrenctLocation(sender: AnyObject) {
        //self.locMan.stopUpdatingLocation()
        //self.map.userTrackingMode = .None
    }
    
    @IBAction func getUserAddress(sender: AnyObject) {
        let loc = self.map.userLocation.location
        if loc == nil
        {
            print("I don't know where you are")
            return
        }
        
        let geo = CLGeocoder()
        geo.reverseGeocodeLocation(loc!) { (placemarks, errors) -> Void in
            //code
            if placemarks != nil
            {
                let p = placemarks![0] as! CLPlacemark
                let address = ABCreateStringWithAddressDictionary(p.addressDictionary!, false)
                print("You are at \(address)")
            }
        }
    }
    
    @IBAction func findFood(sender: AnyObject) {
        if !determineStatus()
        {
            print("You have not authorized location services")
            return
        }
        
        let userLoc = CLLocation(latitude: self.map.centerCoordinate.latitude, longitude: self.map.centerCoordinate.longitude)
//        let userLoc = self.map.userLocation.location
//        if userLoc == nil
//        {
//            print("I don't know where you are")
//            return
//        }
        
        let req = MKLocalSearchRequest()
        req.region = self.map.region
        req.naturalLanguageQuery = "pizza"
        
        let search = MKLocalSearch(request: req)
        search.startWithCompletionHandler { (response, error) -> Void in
            if response == nil
            {
                print(error)
                return
            }
            self.map.showsUserLocation = false
//            let m1 = response!.mapItems[0] as MKMapItem
//            let place = m1.placemark
//            let loc = place.location!.coordinate
//            
//            
//            let pizzaPlace1 = MKPointAnnotation()
//            pizzaPlace1.title = m1.name
//            pizzaPlace1.subtitle = m1.phoneNumber
//            pizzaPlace1.coordinate = loc
//            
//            let pizzaPlace2 = Pizza(title: m1.name!, subtitle: m1.phoneNumber!, coordinate: (response!.mapItems[1] as MKMapItem).placemark.location!.coordinate)
//            
//            self.map.addAnnotation(pizzaPlace1)
//            
//            self.map.addAnnotation(pizzaPlace2)
            
            var mapAnnots = [MKAnnotation]()
            for place in response!.mapItems
            {
                let tempPizza = Pizza(title: place.name!, subtitle: place.phoneNumber!, coordinate: place.placemark.location!.coordinate)
                mapAnnots.append(tempPizza)
            }
            self.map.addAnnotations(mapAnnots)
        }
    }
    
    @IBAction func openInMaps(sender: AnyObject) {
        let mi = MKMapItem.mapItemForCurrentLocation()
        mi.openInMapsWithLaunchOptions([MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue])
    }
    
    @IBAction func getDirections(sender: AnyObject) {
        if !determineStatus()
        {
            print("You have not authorized location services")
            return
        }
        
//        let userLoc = self.map.userLocation.location
        let userLoc = CLLocation(latitude: self.map.centerCoordinate.latitude, longitude: self.map.centerCoordinate.longitude)
//        if userLoc == nil
//        {
//            print("I don't know where you are")
//            return
//        }
        
        let req = MKLocalSearchRequest()
        req.region = self.map.region
        req.naturalLanguageQuery = "pizza"
        
        let search = MKLocalSearch(request: req)
        search.startWithCompletionHandler { (response, error) -> Void in
            if response == nil
            {
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
                if response == nil
                {
                    print(error)
                    return
                }
                
                print("Got directions")
                
                let route = response!.routes[0]
                let poly = route.polyline
                self.map.addOverlay(poly)
                
                for step in route.steps
                {
                    print("After \(step.distance) meters \(step.instructions)")
                }
                
            })
        }
    }
}

