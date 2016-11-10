//
//  CameraViewController.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/31/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import UIKit
import GoogleMaps

class CameraViewController: UIViewController, ARLocationDelegate, ARDelegate, ARMarkerDelegate, MarkerViewDelegate {
    
    var directions: direction!
    var userLocation: CLLocation!
    var geoLocationsArray = [ARGeoCoordinate]()
    var _arController:AugmentedRealityController!
    let locationManager = CLLocationManager()
    var navigationOn = false
    var legsCount = 0
    var stepsCount = 0
    var currentLeg = 0
    var currentStep = 0
    var overviewCoordinateCount = 0
    var currentOverviewCoordinate = 1
    var userUpdatedBearing = 0.0
    let directionServices = DirectionService()
    var overrviewCoordinateLocation : CLLocation!
    var stepEndCoordinateLocation : CLLocation!
    var arGeoCoordinate:ARGeoCoordinate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (_arController == nil) {
            _arController = AugmentedRealityController(view: self.view, parentViewController: self, withDelgate: self)
            
            _arController!.minimumScaleFactor = 0.5
            _arController!.scaleViewsBasedOnDistance = true
            _arController!.rotateViewsBasedOnPerspective = true
            _arController!.debugMode = false
        }
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationManager.delegate = self
        locationManager.desiredAccuracy =  kCLLocationAccuracyBestForNavigation
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    func generateGeoLocations() {
        if((arGeoCoordinate) != nil){
            _arController?.removeCoordinate(arGeoCoordinate)
            geoLocationsArray.popLast()
        }
        let step = self.directions.routes?[0].legs?[0].steps?[currentStep]
        let title = step?.html_instructions
        self.arGeoCoordinate = ARGeoCoordinate(location: overrviewCoordinateLocation, locationTitle: title)
                    
        arGeoCoordinate.calibrate(usingOrigin: userLocation)
        
        let markerView:MarkerView = MarkerView(_coordinate: arGeoCoordinate, _delegate: self)
        arGeoCoordinate.displayView = markerView
        
        _arController?.addCoordinate(arGeoCoordinate)
        geoLocationsArray.append(arGeoCoordinate)
    }
    
    func didUpdate(_ newHeading:CLHeading){
        
    }
    func didUpdate(_ newLocation:CLLocation){
        
    }
    func didUpdate(_ orientation:UIDeviceOrientation) {
        
    }
    
    func didTapMarker(_ coordinate:ARGeoCoordinate) {
        
    }
    
    public func locationClicked(_ coordinate: ARGeoCoordinate!) {
       
    }
    
    func didTouchMarkerView(_ markerView:MarkerView) {
        
    }

    
    func geoLocations() -> NSMutableArray{
        
        if(geoLocationsArray.count == 0) {
            generateGeoLocations()
        }
        return NSMutableArray(array: geoLocationsArray) ;
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController  = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? ViewController
        if let secondViewController = secondViewController {
            self.present(secondViewController, animated:true, completion:nil)
        }
    }

}

extension CameraViewController: CLLocationManagerDelegate {
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got current location")
        self.userLocation = manager.location
        let currentLocation = userLocation
        if(navigationOn){
            let step = self.directions.routes?[0].legs?[0].steps?[currentStep]
            
            self.overrviewCoordinateLocation = CLLocation.init(latitude: (directions?.routes?[0].overview_polyline?.coordinates?[currentOverviewCoordinate].lat)!, longitude: (directions?.routes?[0].overview_polyline?.coordinates?[currentOverviewCoordinate].lng)!)
            
            self.stepEndCoordinateLocation = CLLocation.init(latitude: (step?.end_location!.lat)!, longitude:  (step?.end_location?.lng)!)
            
            userUpdatedBearing = directionServices.getBearingBetweenTwoPoints1(point1:(currentLocation?.coordinate)!, point2: (overrviewCoordinateLocation.coordinate))
            
            let currentPoint = GMSCameraPosition.camera(withTarget: (currentLocation?.coordinate)!, zoom: 18.0, bearing: userUpdatedBearing, viewingAngle: 50)
            //mapView.animate(to: currentPoint)
            
            let overviewDistance : CLLocationDistance = (currentLocation?.distance(from: self.overrviewCoordinateLocation))!
            if(overviewDistance < 1.0){
                if(currentOverviewCoordinate < overviewCoordinateCount){
                    currentOverviewCoordinate += 1
                } else {
                    print("Reached Destination")
                }
            }
            let stepDistance : CLLocationDistance = (currentLocation?.distance(from: self.stepEndCoordinateLocation))!
            if(stepDistance < 1.0){
                if(currentStep < self.stepsCount){
                    currentStep += 1
                } else {
                    print("Reached Destination")
                }
            }
            geoLocations()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("Location Update Failed")
    }
    
    
}

