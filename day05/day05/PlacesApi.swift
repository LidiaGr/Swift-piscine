//
//  PlacesApi.swift
//  day05
//
//  Created by Lidia Grigoreva on 26.06.2021.
//
import MapKit

class PlacesAPI {
    private static var allPlaces = [
        Place(title: "School 21 Kazan", coordinate: CLLocationCoordinate2D(latitude: 55.78202336617276, longitude: 49.125136555061616) , info: "Second School in Russia", color: .red),
        Place(title: "School 21 Moscow", coordinate: CLLocationCoordinate2D(latitude: 55.79723253743663, longitude: 37.57978233918763), info: "First School in Russia", color: .blue),
        Place(title: "Ecole 42 Paris", coordinate: CLLocationCoordinate2D(latitude: 48.89661403264069, longitude: 2.3187477617230985), info: "First School ever", color: .purple),
        Place(title: "Ecole 42 Heilbronn", coordinate: CLLocationCoordinate2D(latitude: 49.15327276589704, longitude: 9.216014919637646), info: "First School in Germany", color: .systemYellow)
    ]
    
    static func getPlaces() -> [Place] {
        return allPlaces
    }
}
