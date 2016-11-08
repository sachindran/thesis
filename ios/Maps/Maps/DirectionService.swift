//
//  DirectionService.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/22/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import Foundation
import CoreLocation

class DirectionService {
    //from: Coordinates, to: Coordinates, 
    func getDirections(from : CLLocationCoordinate2D, to: CLLocationCoordinate2D, plotRoute: @escaping (direction) -> Void ){
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let origin = "\(from.latitude),\(from.longitude)"
        let destination = "\(to.latitude),\(to.longitude)"
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&key=AIzaSyDwp9AyjI0jreUqcEj5iStuU79BX8c3--o")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        if let directions = try direction(json: json) {
                           plotRoute(directions)
                            return
                        }
                    }
                    
                } catch {
                    print("error in JSONSerialization")
                    return
                }
            }
        })
        task.resume()
    }
    
    func degreesToRadians(degrees: Double) -> Double { return degrees * M_PI / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / M_PI }
    
    func getBearingBetweenTwoPoints1(point1 : CLLocationCoordinate2D, point2 : CLLocationCoordinate2D) -> Double {
        
        let lat1 = degreesToRadians(degrees: point1.latitude)
        let lon1 = degreesToRadians(degrees: point1.longitude)
        
        let lat2 = degreesToRadians(degrees: point2.latitude)
        let lon2 = degreesToRadians(degrees: point2.longitude)
        
        let dLon = lon2 - lon1
        
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)
        
        return radiansToDegrees(radians: radiansBearing)
    }
}
