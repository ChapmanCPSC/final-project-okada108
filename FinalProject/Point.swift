//
//  Point.swift
//  FinalProject
//
//  Created by Bryan Okada on 5/10/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit
import MapKit

class Point: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
