//
//  LocationDataWrapper.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 01.12.2020.
//

import Foundation
import SwiftKeychainWrapper
import CoreLocation

class LocationDataWrapper {
    
    private static let locationKey = "DataWrapper.Location"
    private init() {}
    static let shared = LocationDataWrapper()
    
    var location: CLLocationCoordinate2D? {
        get {
            guard let dict = KeychainWrapper.standard.object(forKey: LocationDataWrapper.locationKey) as? NSDictionary else { return nil }
            if let lat = dict["lat"] as? Double,
               let lon = dict["lon"] as? Double {
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                return coordinate
            }
            return nil
        }
        set (updatedValue) {
            guard (updatedValue != nil) else { return }
            let dict = [
                "lat": updatedValue?.latitude,
                "lon": updatedValue?.longitude]
            KeychainWrapper.standard.set(dict as NSCoding, forKey: LocationDataWrapper.locationKey)
        }
    }
    
    func removeLocation() {
        KeychainWrapper.standard.removeObject(forKey: LocationDataWrapper.locationKey)
    }
    
    
}
