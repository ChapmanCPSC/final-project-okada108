//
//  Pin.swift
//  FinalProject
//
//  Created by Bryan Okada on 5/9/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import Foundation
import CoreData
import MapKit


class Pin: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(title: String, sub_title: String, latt : Double, long : Double, context: NSManagedObjectContext){
        
        let entity = NSEntityDescription.entityForName("Pin", inManagedObjectContext: context)!
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        name = title
        subtitle = sub_title
        lattitude = NSNumber(double: latt)
        longitude = NSNumber(double: long)
    }
    

    
    
    


}
