//
//  ServiceProvider.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 30.09.2020.
//

import Foundation


class ServicesContainer {
    
    // MARK: - Single Services
    var locationService: LocationService!
    var imageService: ImageService!
    
    // MARK: - Services Containers
    
    init() {
        // MARK: - Init Single Services
        self.locationService = LocationService()
        self.imageService = ImageService.shared
        
        
        // MARK: - Init Services Containers
    }
    
}
