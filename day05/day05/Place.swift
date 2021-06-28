//
//  PlacesAPI.swift
//  day05
//
//  Created by Lidia Grigoreva on 26.06.2021.
//

import UIKit
import MapKit

class Place: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var color: UIColor
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, color: UIColor) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.color = color
    }
}
