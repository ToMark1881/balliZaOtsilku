//
//  CLLocationCoordinate2D+Extensions.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal Mobile Team on 4/3/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import CoreLocation


public func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}

extension CLLocationCoordinate2D {
    
    func distanceTo(_ coordinate: CLLocationCoordinate2D) -> CLLocationDistance {
        let thisLocation = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let otherLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        return thisLocation.distance(from: otherLocation)
    }

    var isInvalid: Bool {
        return self == kCLLocationCoordinate2DInvalid
    }
}
