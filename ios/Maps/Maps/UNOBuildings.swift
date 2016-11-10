//
//  UNOBuildings.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/31/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import Foundation
import CoreLocation

struct Building {
    let Name: String
    let Coordinates: CLLocationCoordinate2D
}

class UNOBuilidings: NSObject  {
    let buildings: [Building] = [
        Building(Name : "Test 1",Coordinates : CLLocationCoordinate2D.init(latitude:37.4001125, longitude: -121.959726)),
        Building(Name : "Test 2",Coordinates : CLLocationCoordinate2D.init(latitude:37.436209, longitude: -121.8942037)),
        Building(Name : "Administration Building (AD)",Coordinates : CLLocationCoordinate2D.init(latitude:30.0265908, longitude: -90.0687805)),
        Building(Name : "Advanced Technology Center",Coordinates : CLLocationCoordinate2D.init(latitude:30.0319744, longitude: -90.0666836)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Athletic Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0539645)),
        Building(Name : "ATM",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0277085, longitude: -90.0685991)),
        Building(Name : "Bicentennial Education Center (ED)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0269345, longitude: -90.0696859)),
        Building(Name : "Biology Building (BIO)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0269345, longitude: -90.0696859)),
        Building(Name : "Center for Energy Resource Management (CERM)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0304945, longitude: -90.0663327)),
        Building(Name : "Chemistry-Sciences Annex (CSB)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0263246, longitude: -90.0682276)),
        Building(Name : "Computer Center (CC)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0263246, longitude: -90.0682276)),
        Building(Name : "The Cove",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0264361, longitude: -90.0691932)),
        Building(Name : "Earl K. Long Library (LIB)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0264361, longitude: -90.0691932)),
        Building(Name : "Engineering Building (EN)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0264361, longitude: -90.0691932)),
        Building(Name : "Facility Services",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0279937, longitude: -90.0696798)),
        Building(Name : "Fine Arts Building (FA)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0279937, longitude: -90.0696798)),
        Building(Name : "Geology &amp; Psychology Building",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0279937, longitude: -90.0696798)),
        Building(Name : "Homer L. Hitt Alumni Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0292477, longitude: -90.0681563)),
        Building(Name : "Human Performance Center (HPC)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0276593, longitude: -90.0662788)),
        Building(Name : "International Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0311299, longitude: -90.0648232)),
        Building(Name : "Kirschman Hall (KH)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0311299, longitude: -90.0689243)),
        Building(Name : "Lafitte Village",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0246244, longitude: -90.0690664)),
        Building(Name : "Lakefront Arena",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0297087, longitude: -90.0542144)),
        Building(Name : "Liberal Arts Building (LA)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0283952, longitude: -90.074955)),
        Building(Name : "Maestri Field at First NBC Ballpark",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0302556, longitude: -90.0505327)),
        Building(Name : "Mathematics Building (MATH)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0299614, longitude: -90.0691808)),
        Building(Name : "Milneburg Hall",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0278476, longitude: -90.0680628)),
        Building(Name : "Navy Information Technology Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0321572, longitude: -90.0609189)),
        Building(Name : "Newman Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0277533, longitude: -90.0648985)),
        Building(Name : "Oliver St. Pé Center - TRAC",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0237203, longitude: -90.069511)),
        Building(Name : "Parking Lots",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0271486, longitude: -90.0712017)),
        Building(Name : "Performing Arts Center (PAC)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0277028, longitude: -90.0680419)),
        Building(Name : "Pontchartrain Hall North",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0252022, longitude: -90.0659541)),
        Building(Name : "Pontchartrain Hall South",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0252022, longitude: -90.0654432)),
        Building(Name : "Privateer Enrollment Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0264074, longitude: -90.0680128)),
        Building(Name : "Privateer Place (PRVTER)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.029626, longitude: -90.0724492)),
        Building(Name : "Recreation &amp; Fitness Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0294356, longitude: -90.0662425)),
        Building(Name : "The Sandbar at The Cove",Coordinates : CLLocationCoordinate2D.init(latitude: 30.027954, longitude: -90.0722507)),
        Building(Name : "School of Hotel, Restaurant &amp; Tourism Administration",Coordinates : CLLocationCoordinate2D.init(latitude: 30.030332, longitude: -90.0705877)),
        Building(Name : "Science Building (SC)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.025878, longitude: -90.0695738)),
        Building(Name : "Tennis Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0283395, longitude: -90.0473533)),
        Building(Name : "University Center (UC)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0291822, longitude: -90.0653268)),
        Building(Name : "UNO Federal Credit Union",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0306293, longitude: -90.0692055)),
        ]
}
