//
//  ViewController.swift
//  day05
//
//  Created by Lidia Grigoreva on 26.06.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    let map = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = map
    
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 48.89661403264069, longitude: 2.3187477617230985)
        pin.title = "42"
        pin.subtitle = "Alma Mater"
        
        map.addAnnotation(pin)
        map.showAnnotations([pin], animated: true)
    }
    
}

