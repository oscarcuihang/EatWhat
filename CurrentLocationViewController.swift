//
//  CurrentLocationViewController.swift
//  EatWhat
//
//  Created by Hang Cui on 11/7/15.
//  Copyright © 2015 Hang Cui. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var locationLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
  
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()

        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
//
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
//            
//            if (error != nil) {
//                print("Reverse geocoder failed with error" + error!.localizedDescription)
//                return
//            }
//            
//            if placemarks!.count > 0 {
//                let pm = placemarks![0] as CLPlacemark
//                self.displayLocationInfo(pm)
//                print(1)
//            } else {
//                print("Problem with the data received from geocoder")
//            }
//        })
//    }
//    
//    func displayLocationInfo(placemark: CLPlacemark?) {
//        
//        locationManager.stopUpdatingLocation()
//        print(placemark?.locality)
//        print(placemark?.location?.coordinate.longitude)
//        print(placemark?.location?.coordinate.latitude)
//
//        
//        if let containsPlacemark = placemark {
//            //stop updating location to save battery life
//            locationManager.stopUpdatingLocation()
//            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
//            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
//            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
//            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
//            let lat = String(containsPlacemark.location!.coordinate.latitude)
//            let lon = String(containsPlacemark.location!.coordinate.longitude)
//        }
//
//        
//    }
//    
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        print("Error while updating location " + error.localizedDescription)
//    }
//    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
