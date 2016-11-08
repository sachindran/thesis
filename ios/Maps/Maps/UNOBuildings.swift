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
        Building(Name : "Work Building (AD)",Coordinates : CLLocationCoordinate2D.init(latitude:37.436209, longitude: -121.8942037)),
        Building(Name : "Administration Building (AD)",Coordinates : CLLocationCoordinate2D.init(latitude:30.0265908, longitude: -90.0687805)),
        Building(Name : "Advanced Technology Center",Coordinates : CLLocationCoordinate2D.init(latitude:30.0319744, longitude: -90.0666836)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Athletic Center",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0539645)),
        Building(Name : "ATM",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0277085, longitude: -90.0685991)),
        Building(Name : "Bicentennial Education Center (ED)",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0269345, longitude: -90.0696859)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        Building(Name : "Amphitheater",Coordinates : CLLocationCoordinate2D.init(latitude: 30.0281303, longitude: -90.0679018)),
        
        ]
    
//    ]
    
//    
//    name: "Administration Annex",
//    coordinates: "30.0265908,-90.0687805"
//    },
//    {
//    name: "Advanced Technology Center",
//    coordinates: "30.0319744,-90.0666836"
//    },
//    {
//    name: "Amphitheater",
//    coordinates: "30.0281303,-90.0679018"
//    },
//    {
//    name: "Athletic Center",
//    coordinates: "30.0280219,-90.0539645"
//    },
//    {
//    name: "ATM",
//    coordinates: "30.0277085,-90.0685991"
//    },
//    {
//    name: "Bicentennial Education Center (ED)",
//    coordinates: "30.0269345,-90.0696859"
//    },
//    {
//    name: "Biology Building (BIO)",
//    coordinates: "30.0269345,-90.0696859"
//    },
//    {
//    name: "Center for Energy Resource Management (CERM)",
//    coordinates: "30.0304945,-90.0663327"
//    },
//    {
//    name: "Chemistry-Sciences Annex (CSB)",
//    coordinates: "30.0263246,-90.0682276"
//    },
//    {
//    name: "Computer Center (CC)",
//    coordinates: "30.0263246,-90.0682276"
//    },
//    {
//    name: "The Cove",
//    coordinates: "30.0264361,-90.0691932"
//    },
//    {
//    name: "Earl K. Long Library (LIB)",
//    coordinates: "30.0264361,-90.0691932"
//    },
//    {
//    name: "Engineering Building (EN)",
//    coordinates: "30.0264361,-90.0691932"
//    },
//    {
//    name: "Facility Services",
//    coordinates: "30.0279937,-90.0696798"
//    },
//    {
//    name: "Fine Arts Building (FA)",
//    coordinates: "@30.0279937,-90.0696798"
//    },
//    {
//    name: "Geology &amp; Psychology Building ",
//    coordinates: "30.0279937,-90.0696798"
//    },
//    {
//    name: "Homer L. Hitt Alumni Center",
//    coordinates: "30.0292477,-90.0681563"
//    },
//    {
//    name: "Human Performance Center (HPC)",
//    coordinates: "30.0276593,-90.0662788"
//    },
//    {
//    name: "International Center",
//    coordinates: "30.02755,-90.0648232"
//    },
//    {
//    name: "Kirschman Hall (KH)",
//    coordinates: "30.0311299,-90.0689243"
//    },
//    {
//    name: "Lafitte Village",
//    coordinates: "30.0246244,-90.0690664"
//    },
//    {
//    name: "Lakefront Arena",
//    coordinates: "30.0297087,-90.0542144"
//    },
//    {
//    name: "Liberal Arts Building (LA)",
//    coordinates: "30.0283952,-90.074955"
//    },
//    {
//    name: "Maestri Field at First NBC Ballpark",
//    coordinates: "30.0302556,-90.0505327"
//    },
//    {
//    name: "Main Entrance",
//    coordinates: "30.0299614,-90.0698461"
//    },
//    {
//    name: "Mathematics Building (MATH)",
//    coordinates: "30.0282639,-90.0691808"
//    },
//    {
//    name: "Milneburg Hall",
//    coordinates: "30.0278476,-90.0680628"
//    },
//    {
//    name: "Navy Information Technology Center",
//    coordinates: "30.0321572,-90.0609189"
//    },
//    {
//    name: "Newman Center",
//    coordinates: "@30.0277533,-90.0648985,"
//    },
//    {
//    name: "Oliver St. Pé Center - TRAC",
//    coordinates: "30.0237203,-90.069511"
//    },
//    {
//    name: "Parking Lots",
//    coordinates: "30.0271486,-90.0712017"
//    },
//    {
//    name: "Performing Arts Center (PAC)",
//    coordinates: "30.0277028,-90.0680419"
//    },
//    {
//    name: "Pontchartrain Hall North",
//    coordinates: "30.0260146,-90.0659541"
//    },
//    {
//    name: "Pontchartrain Hall South",
//    coordinates: "30.0252022,-90.0654432"
//    },
//    {
//    name: "Privateer Enrollment Center",
//    coordinates: "30.0264074,-90.0680128"
//    },
//    {
//    name: "Privateer Place (PRVTER)",
//    coordinates: "30.029626,-90.0724492"
//    },
//    {
//    name: "Recreation &amp; Fitness Center",
//    coordinates: "30.0294356,-90.0662425"
//    },
//    {
//    name: "The Sandbar at The Cove",
//    coordinates: "30.027954,-90.0722507"
//    },
//    {
//    name: "School of Hotel, Restaurant &amp; Tourism Administration",
//    coordinates: "30.030332,-90.0705877"
//    },
//    {
//    name: "Science Building (SC)",
//    coordinates: "30.025878,-90.0695738"
//    },
//    {
//    name: "Tennis Center",
//    coordinates: "30.0283395,-90.0473533"
//    },
//    {
//    name: "University Center (UC)",
//    coordinates: "30.0291822,-90.0653268"
//    },
//    {
//    name: "UNO Federal Credit Union",
//    coordinates: "30.0306293,-90.0692055"
//    })]
//    }

}
