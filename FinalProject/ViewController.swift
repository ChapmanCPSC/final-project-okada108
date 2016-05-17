//
//  ViewController.swift
//  FinalProject
//
//  Created by Bryan Okada on 5/8/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, DestinationDelegate {
    
    
    @IBOutlet var lbl_title: UILabel!
    
    
    @IBOutlet var txt_description: UITextView!
    
    
    
    @IBOutlet var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var appDelegate : AppDelegate!
    var sharedContent: NSManagedObjectContext!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        sharedContent = appDelegate.managedObjectContext
        //map.delegate = self
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        // self.locationManager.requestAlwaysAuthorization()
        
        let authorized = CLLocationManager.authorizationStatus()
        
        mapViewWillStartLocatingUser(self.map)
        
        self.map.showsUserLocation = true

        self.locationManager.startUpdatingLocation()
        
        
        map.addAnnotations(getAllPins())
        
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //
        //
        //
        //        checkAuthorization()
        //        map.addAnnotations(getAllPins())
        //        self.map.showsUserLocation = true
        
    }
    
    func checkAuthorization (){
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapViewWillStartLocatingUser(self.map)
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
        //let pin = view.annotation as! Pin
        
        
        if Double(view.annotation!.coordinate.latitude) == Double(self.map.userLocation.coordinate.latitude) && Double(view.annotation!.coordinate.longitude) == Double(self.map.userLocation.coordinate.longitude){
            self.lbl_title.text = "Your location"
            self.txt_description.text = ""
        }
        else {
            let pin = view.annotation as! Pin
            self.lbl_title.text = pin.name
            self.txt_description.text = pin.subtitle
        }
        
        
        appDelegate.saveContext()
    }
    
    
    func getAllPins() -> [Pin]{
        let error : NSErrorPointer = nil
        let fetch = NSFetchRequest(entityName: "Pin")
        let results : [AnyObject]?
        do {
            results = try sharedContent.executeFetchRequest(fetch)
        } catch let error1 as NSError {
            error.memory = error1
            results = nil
        }
        if error != nil {
            print("Error" + "\(error)")
            
        }
        return results as! [Pin]
        
    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()

        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        self.map.setRegion(region, animated: true)
        
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error" + error.localizedDescription)
    }
    
    
    
    @IBAction func btn_add(sender: AnyObject) {
        
        
        var lat = Double(self.map.userLocation.coordinate.latitude)
        var long = Double(self.map.userLocation.coordinate.longitude)
        
        let navVC = self.storyboard!.instantiateViewControllerWithIdentifier("point_setting") as! UINavigationController
        let settingVC = navVC.viewControllers[0] as! PointSettingViewController
        settingVC.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        settingVC.delegate = self
        
        self.presentViewController(navVC, animated: true, completion: nil)
        
        
    }
    
    func setPin(point: Pin) {
        map.addAnnotation(point)
    }
    
    
    func mapViewWillStartLocatingUser(mapView: MKMapView) {
        let map = mapView
        let location = map.userLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        map.setRegion(region, animated: true)
        map.setCenterCoordinate(center, animated: true)
        self.locationManager.stopUpdatingLocation()
        
    }
    
    @IBAction func btn_update(sender: AnyObject) {
        
        mapViewWillStartLocatingUser(map)
        
    }
    
       
    
    
    
    
    
}

