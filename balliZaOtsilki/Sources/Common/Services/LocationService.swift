//
//  LocationService.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal Mobile Team on 3/20/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit


class LocationService: NSObject {

    fileprivate var successCallback: ((CLLocation) -> Void)?
    fileprivate var failureCallback: FailureCallback?
    
    fileprivate var isUpdated: Bool = false

    fileprivate lazy var locationManager: CLLocationManager = { return CLLocationManager() }()

    override init() {
        super.init()
        
        self.locationManager.delegate = self
    }
    
    func locationServicesEnabled() -> Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways
    }

    fileprivate func check(_ onlyCurrentLocation: Bool) {
        Logger.shared.log("check", type: .localNotifications)

        self.isUpdated = false
        
        if !locationServicesEnabled() && !onlyCurrentLocation {
            if let location = self.getLocaitonFromStorage() {
                self.successCallback?(location)
                return
            }
        }
        
        if CLLocationManager.locationServicesEnabled() {
            Logger.shared.log("check startUpdatingLocation", type: .localNotifications)
            self.locationManager.requestAlwaysAuthorization()
            self.locationManager.startUpdatingLocation()
        } else {
            Logger.shared.log("check ErrorsFactory.General.location", type: .localNotifications)
            self.failureCallback?(ErrorsFactory.General.location)
        }
    }

    func fetchCurrentLocation(onlyCurrentLocation: Bool = false, _ completed: @escaping (CLLocation?) -> Void, failure: FailureCallback?) {
        Logger.shared.log("fetch current location", type: .localNotifications)
        
        self.successCallback = completed
        self.failureCallback = failure
        
        DispatchQueue.main.async {
            self.check(onlyCurrentLocation)
        }
    }
    
    func openAppleMaps(with destination: CLLocationCoordinate2D, and destinationName: String? = "") {
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        destination.name = destinationName
        destination.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    func openGoogleMaps(with destination: CLLocationCoordinate2D, and destinationName: String? = "") {
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            let googleMapsUrl = URL(string: "comgooglemaps://?saddr=&daddr=\(Float(destination.latitude)),\(Float(destination.longitude))&directionsmode=driving")!
            UIApplication.shared.open(googleMapsUrl, options: [:], completionHandler: nil)
        }
    }
    
    fileprivate func getLocaitonFromStorage() -> CLLocation? {
        if let coordinate = LocationDataWrapper.shared.location {
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            self.isUpdated = true
            return location
        }
        return nil
    }
    
}

// MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !self.isUpdated, let location = locations.first {
            Logger.shared.log("locationManager didUpdateLocations", type: .localNotifications)
            LocationDataWrapper.shared.location = location.coordinate
            self.successCallback?(location)
            self.isUpdated = true
        }
        
        self.locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Logger.shared.log("locationManager didFailWithError \(error.localizedDescription)", type: .localNotifications)
        if let location = self.getLocaitonFromStorage() {
            self.successCallback?(location)
        }
        else if !self.isUpdated {
            self.failureCallback?(ErrorsFactory.General.location)
            self.isUpdated = true
        }
    }
}
