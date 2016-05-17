//
//  Pin+CoreDataProperties.swift
//  FinalProject
//
//  Created by Bryan Okada on 5/9/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData
import MapKit

extension Pin : MKAnnotation  {

    @NSManaged var name: String?
    @NSManaged var subtitle: String?
    @NSManaged var longitude: NSNumber?
    @NSManaged var lattitude: NSNumber?
    
    var title : String? {
        return name 
    }
    
    var coordinate : CLLocationCoordinate2D{
        
        
            return CLLocationCoordinate2D(latitude: Double(lattitude!), longitude: Double(longitude!))
        
    }

}
