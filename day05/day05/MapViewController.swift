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
    let segmentedControll = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        setupMapView()
        setupSegmentedControll()
        
        
//        let pin = MKPointAnnotation()
//        pin.coordinate = CLLocationCoordinate2D(latitude: 48.89661403264069, longitude: 2.3187477617230985)
//        pin.title = "42"
//        pin.subtitle = "Alma Mater"
        
//        map.addAnnotation(pin)
//        map.showAnnotations([pin], animated: true)
        
        map.addAnnotations(PlacesAPI.getPlaces())
        map.showAnnotations(PlacesAPI.getPlaces(), animated: true)
    }
    
    func setupSegmentedControll() {
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.selectedSegmentTintColor = .systemBlue
        segmentedControll.backgroundColor = .white
        segmentedControll.layer.borderWidth = 1
        segmentedControll.layer.borderColor = UIColor.systemBlue.cgColor
        segmentedControll.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentedControll.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .normal)
        
        segmentedControll.addTarget(self, action: #selector(changeMapViewType(_:)), for: .valueChanged)
        
        map.addSubview(segmentedControll)
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        segmentedControll.bottomAnchor.constraint(equalTo: map.bottomAnchor, constant: -10).isActive = true
        segmentedControll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupMapView() {
        view.addSubview(map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func changeMapViewType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            map.mapType = .standard
        case 1:
            map.mapType = .hybrid
        case 2:
            map.mapType = .satellite
        default:
            break
        }
    }
    
}

