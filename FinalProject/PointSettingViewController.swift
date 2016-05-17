//
//  PointSettingViewController.swift
//  FinalProject
//
//  Created by Bryan Okada on 5/11/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

protocol DestinationDelegate{
    func setPin(point: Pin)
}

class PointSettingViewController: UIViewController {
    
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var location : CLLocationCoordinate2D!
    
    var delegate : DestinationDelegate! = nil
    @IBOutlet var title_text: UITextField!
    
    @IBOutlet var subtitle_text: UITextView!
    
    
    
    var newPoint : Pin?  {
        return Pin(title: title_text.text!, sub_title: subtitle_text.text!, latt: Double(self.location.latitude), long: Double(self.location.longitude), context: appDelegate.managedObjectContext)
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        if let point = newPoint
//        {
//            self.title_text.text = point.title!
//            self.subtitle_text.text = point.subtitle!
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btn_back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func validateFields() -> Bool{
        guard title_text.text?.characters.count > 0 else{
            navigationItem.prompt = "Please add a title"
            return false
        }
        
        guard subtitle_text.text?.characters.count > 0 else{
            navigationItem.prompt = "Pleaes add a subtitle"
            return false
        }
        
        return true
        
    }
    
    
    @IBAction func btn_save(sender: AnyObject) {
        
        
        //let pin = Pin(title: title_text.text!, sub_title: subtitle_text.text!, latt: Double(self.location.latitude), long: Double(self.location.longitude), context: appDelegate.managedObjectContext)
        
        if validateFields(){
            navigationItem.prompt = nil
            dismissViewControllerAnimated(true, completion: {self.delegate.setPin(self.newPoint!)})

            
            appDelegate.saveContext()
    
            
        }
}
}

    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
             
             //            let pin = NSEntityDescription.insertNewObjectForEntityForName("Pin", inManagedObjectContext: appDelegate.managedObjectContext) as! Pin
             //            pin.name = self.title_text.text!
             //            pin.subtitle = self.subtitle_text.text!
             //            pin.lattitude = Double(self.location.latitude)
             //            pin.longitude = Double(self.location.longitude)
             //            //pin.coordinate = CLLocationCoordinate2D(latitude: Double(self.location.latitude), longitude: Double(self.location.longitude))
    */
