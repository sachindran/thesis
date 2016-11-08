//
//  Coordinates.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/22/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import Foundation

class Coordinates: NSObject {
    
    var lat: Double
    var lng: Double
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
     }
    
    static let coordinatesBuilder: @convention(block) ([[String : Double]]) -> [Coordinates] = { object in
        return object.map { dict in
            
            guard
                let lat = dict["lat"],
                let lng = dict["lng"] else {
                    print("unable to parse Coordinates objects.")
                    fatalError()
            }
            
            return Coordinates(lat: lat, lng: lng)
        }
    }
}
