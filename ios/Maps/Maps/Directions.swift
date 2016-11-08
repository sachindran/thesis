//
//  Directions.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/20/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import Foundation
import Gloss

struct distance: Decodable {
    let text: String?
    let value: Float?
    
    init?(json: JSON) {
        self.text = "text" <~~ json
        self.value = "value" <~~ json
    }
}

struct duration: Decodable {
    let text: String?
    let value: Float?
    
    init?(json: JSON) {
        self.text = "text" <~~ json
        self.value = "value" <~~ json
    }
}

struct location: Decodable {
    let lat: Double?
    let lng: Double?
    
    init?(json: JSON) {
        self.lat = "lat" <~~ json
        self.lng = "lng" <~~ json
    }
}

struct polyline: Decodable {
    let points: String?
    var coordinates: [Coordinates]?
    let coordService : CoordinateService?
    
    init?(json: JSON) {
        self.points = "points" <~~ json
        self.coordService = CoordinateService()
        self.coordinates = self.coordService?.decodeCoordinatesFrom(encodedPath: points!)
    }
}

struct steps: Decodable {
    let distance: distance?
    let duration: duration?
    let end_location: location?
    let html_instructions: String?
    let polyline: polyline?
    let start_location: location?
    let travel_mode: String?
    
    init?(json: JSON) {
        self.distance = "distance" <~~ json
        self.duration = "duration" <~~ json
        self.end_location = "end_location" <~~ json
        self.html_instructions = "html_instructions" <~~ json
        self.polyline = "polyline" <~~ json
        self.start_location = "start_location" <~~ json
        self.travel_mode = "travel_mode" <~~ json
    }
}

struct legs: Decodable {
    let distance: distance?
    let duration: duration?
    let end_address: String?
    let end_location: location?
    let start_address: String?
    let start_location: location?
    let steps: [steps]?
    
    init?(json: JSON) {
        self.distance = "distance" <~~ json
        self.duration = "duration" <~~ json
        self.end_address = "end_address" <~~ json
        self.end_location = "end_location" <~~ json
        self.start_address = "start_address" <~~ json
        self.start_location = "start_location" <~~ json
        self.steps = "steps" <~~ json
    }
}

struct routes: Decodable {
    //let bounds: bounds?
    let copyrights: String?
    let legs: [legs]?
    let overview_polyline: polyline?
    let summary: String?
    
    init?(json: JSON) {
        //self.bounds = "bounds" <~~ json
        self.copyrights = "copyrights" <~~ json
        self.legs = "legs" <~~ json
        self.overview_polyline = "overview_polyline" <~~ json
        self.summary = "summary" <~~ json
    }
}

struct geocoded_waypoints: Decodable {
    
    let geocoder_status: String?
    let place_id: String?
    let types: [String]?
    
    init?(json: JSON) {
        self.geocoder_status = "geocoder_status" <~~ json
        self.place_id = "place_id" <~~ json
        self.types = "types" <~~ json
    }
    
}

struct direction: Decodable {
    let geocoded_waypoints: [geocoded_waypoints]?
    let routes: [routes]?
    let status: String?
    
    init?(json: JSON) {
        self.geocoded_waypoints = "geocoded_waypoints" <~~ json
        self.routes = "routes" <~~ json
        self.status = "status" <~~ json
    }
}
