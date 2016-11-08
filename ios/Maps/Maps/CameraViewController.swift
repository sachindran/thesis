//
//  CameraViewController.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/31/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, ARLocationDelegate, ARDelegate, ARMarkerDelegate, MarkerViewDelegate {
    
    var directions: direction!
    var userLocation: CLLocation!
    var geoLocationsArray = [ARGeoCoordinate]()
    var _arController:AugmentedRealityController!
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
        geoLocations()
    }
    
    func generateGeoLocations() {
        var previousLocation = userLocation
        for leg in (self.directions.routes?[0].legs)! {
            for step in leg.steps!{
                for coordinate in (step.polyline?.coordinates)!{
                    let startLocation = CLLocation(latitude: coordinate.lat, longitude: coordinate.lng)
                    let coordinate:ARGeoCoordinate = ARGeoCoordinate(location: startLocation, locationTitle: "Start")
                    coordinate.calibrate(usingOrigin: previousLocation)
                    
                    let markerView:MarkerView = MarkerView(_coordinate: coordinate, _delegate: self)
                    coordinate.displayView = markerView
                    
                    _arController?.addCoordinate(coordinate)
                    geoLocationsArray.append(coordinate)
                    previousLocation = startLocation
                }
            }
        }
        
        
        
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
