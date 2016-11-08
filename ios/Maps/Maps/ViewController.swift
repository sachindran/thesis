//
//  ViewController.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/17/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, PopUpCompletionDelegate {

    @IBOutlet weak var mapView1: GMSMapView!
    var mapView: GMSMapView!
    @IBOutlet weak var cameraView: UIView!
    var directions: direction!
    var userLocation: CLLocation!
    let coordServices = CoordinateService()
    let directionServices = DirectionService()
    let locationManager = CLLocationManager()
    let unoBuildings = UNOBuilidings()
    var navigationOn = false
    var legsCount = 0
    var stepsCount = [Int]()
    var currentLeg = 0
    var currentStep = [Int]()
    var overviewCoordinateCount = 0
    var currentOverviewCoordinate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()

        locationManager.delegate = self
        locationManager.desiredAccuracy =  kCLLocationAccuracyBestForNavigation
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func drawMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.3998485, longitude: -121.9586511, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: mapView1.frame, camera: camera)
        mapView.center = CGPoint(x:mapView1.bounds.midX, y:mapView1.bounds.midY);
        mapView.isMyLocationEnabled = true
        self.mapView1.addSubview(mapView)
        
        // Get the superview's layout
//        let margins = mapView1.layoutMarginsGuide
//        
//        mapView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
//        //mapView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
//        // Pin the leading edge of myView to the margin's leading edge
//        mapView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        
//        // Pin the trailing edge of myView to the margin's trailing edge
//        mapView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.3998485, longitude: -121.9586511)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func plotRoute(withDirection: direction){
        self.directions = withDirection
        self.legsCount = (withDirection.routes?[0].legs?.count)!
        self.overviewCoordinateCount = (withDirection.routes?[0].overview_polyline?.coordinates?.count)!
        var i = 0
        for leg in (withDirection.routes?[0].legs)! {
            self.stepsCount.append((leg.steps?.count)!)
            self.currentStep.append(0)
            for step in leg.steps!{
                let path = GMSPath.init(fromEncodedPath: (step.polyline?.points)!)
                let polyline = GMSPolyline(path: path)
                polyline.strokeWidth = 10.0
                polyline.map = self.mapView
            }
        }
        
        let overviewPath = GMSPath.init(fromEncodedPath: (withDirection.routes?[0].overview_polyline?.points)!)
        let overviewPolyline = GMSPolyline(path: overviewPath)
        overviewPolyline.strokeColor =  UIColor.red;
        overviewPolyline.strokeWidth = 10.0
        overviewPolyline.map = self.mapView
        
        let startLocation = CLLocation(latitude: withDirection.routes![0].legs![0].steps![0].start_location!.lat!, longitude: withDirection.routes![0].legs![0].steps![0].start_location!.lng!)
        let startLocation1 = CLLocation(latitude: (withDirection.routes![0].legs![0].steps![0].polyline?.coordinates?[1].lat)!, longitude: (withDirection.routes![0].legs![0].steps![0].polyline?.coordinates?[1].lng)!)
        
        
        let direction = directionServices.getBearingBetweenTwoPoints1(point1: startLocation.coordinate, point2: startLocation1.coordinate)
        let start = CLLocationCoordinate2D.init(latitude: startLocation.coordinate.latitude, longitude: startLocation.coordinate.longitude)
        let startingPoint = GMSCameraPosition.camera(withTarget: start, zoom: 18.0, bearing: direction, viewingAngle: 50)
        mapView.animate(to: startingPoint)
        navigationOn = true
    }
    
    @IBAction func swapView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController  = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController
        if let secondViewController = secondViewController {
            self.present(secondViewController, animated:true, completion:nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popoverSegue" {
            
            if let popoverViewController = segue.destination as? PopUpViewController {
                popoverViewController.popoverPresentationController?.delegate = self
                popoverViewController.delegate = self
                popoverViewController.preferredContentSize = CGSize(width: 320, height: 300)
                popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverViewController.popoverPresentationController!.delegate = self
            }
        }
        else if segue.identifier == "cameraSegue" {
            
            if let cameraViewController = segue.destination as? CameraViewController {
                cameraViewController.directions = directions
                cameraViewController.userLocation = userLocation
            }
        }
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate method
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Force popover style
        return UIModalPresentationStyle.none
    }
    
    func rowSelected(at: Int) {
        self.mapView.clear()
        let destination = CLLocation.init(latitude: unoBuildings.buildings[at].Coordinates.latitude, longitude: unoBuildings.buildings[at].Coordinates.longitude)
        if let myLocation = mapView.myLocation {
            self.userLocation = myLocation
            directionServices.getDirections(from: myLocation.coordinate, to:destination.coordinate, plotRoute: plotRoute)
        } else {
            print("Unable to retrieve current location")
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        print("Got current location")
//         var currentLocation = manager.location
//         if(navigationOn){
//             var step = self.directions.routes?[0].legs?[0].steps?[currentStep[0]]
//             var overviewCoordinate = CLLocation.init(latitude: (self.directions.routes?[0].overview_polyline?.coordinates?[currentOverviewCoordinate].lat)!, longitude: (self.directions.routes?[0].overview_polyline?.coordinates?[currentOverviewCoordinate].lng)!)
   //          var stepEndLocation = CLLocation.init(latitude: (step?.end_location!.lat)!, longitude:  (step?.end_location?.lng)!)
            // let direction = directionServices.getBearingBetweenTwoPoints1(point1:(currentLocation?.coordinate)!, point2: (overviewCoordinate.coordinate))
            // let currentPoint = GMSCameraPosition.camera(withTarget: (currentLocation?.coordinate)!, zoom: 18.0, bearing: direction, viewingAngle: 50)
            // mapView.animate(to: currentPoint)
            // var stepDistance = currentLocation?.distance(from: stepEndLocation)
            // var overviewCoordinateDistance = currentLocation?.distance(from: overviewCoordinate)
        // }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedAlways) {
            self.drawMap()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
            }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("Location Update Failed")
    }
    
    
}

