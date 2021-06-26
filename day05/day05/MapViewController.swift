//
//  ViewController.swift
//  day05
//
//  Created by Lidia Grigoreva on 26.06.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    
    let segmentedControll = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    let locationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupMapView()
        setupSegmentedControll()
        addLocationButton()
        checkLocationService()
        
        fetchPlacesOnMap()
    }
    
    func fetchPlacesOnMap() {
        for place in PlacesAPI.getPlaces() {
            let annotations = MKPointAnnotation()
            annotations.title = place.title
            annotations.subtitle = place.info
            annotations.coordinate = place.coordinate
            mapView.addAnnotation(annotations)
        }
    }
    
    func setupMapView() {
        view.addSubview(mapView)
        
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.03496, longitude: 10.20908), latitudinalMeters: 4000000, longitudinalMeters: 4000000), animated: true)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
        
        mapView.addSubview(segmentedControll)
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        segmentedControll.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -10).isActive = true
        segmentedControll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func changeMapViewType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            break
        case 1:
            mapView.mapType = .hybrid
            break
        case 2:
            mapView.mapType = .satellite
            break
        default:
            break
        }
    }
    
    func addLocationButton() {
        let image = UIImage(systemName: "location.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: segmentedControll.frame.height))
        locationButton.setImage(image, for: .normal)
        locationButton.tintColor = .systemBlue
        locationButton.addTarget(self, action: #selector(getMyLocation(_:)), for: .touchUpInside)
        
        mapView.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.centerYAnchor.constraint(equalTo: segmentedControll.centerYAnchor).isActive = true
        locationButton.leadingAnchor.constraint(equalTo: segmentedControll.trailingAnchor, constant: 5).isActive = true
    }
    
    @objc func getMyLocation(_ sender: UIButton) {
        locationButton.tintColor = .systemBlue
        followUserLocation()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Do something to let users know why they need to turn it on.
        }
    }
    
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert telling users how to turn on permissions
            locationManager.requestWhenInUseAuthorization()
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            break
        case .restricted:
            // Show alert telling users how to turn on permissions
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func followUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 4000, longitudinalMeters: 4000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("User changed authorisiton")
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
