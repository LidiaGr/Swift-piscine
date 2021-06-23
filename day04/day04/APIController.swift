//
//  APIController.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

import UIKit

class APIController {
    weak var delegate : APIIntra42Delegate?
    let token : String
    
    init(apiDelegate: APIIntra42Delegate?, apiToken: String) {
        self.delegate = apiDelegate
        self.token = apiToken
    }
    
    func searchVisits(username: String) {
        let request = URL(string: "https://api.intra.42.fr/v2/users/\(username)/locations?per_page=100".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        var url = URLRequest(url: request!)
        url.httpMethod = "GET"
        url.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let err = error {
                self.delegate?.errorOccured(error: err as NSError)
            } else if let recievedData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: recievedData)
                    print(json)
                } catch let err {
                    self.delegate?.errorOccured(error: err as NSError)
                }
            }
        }
        task.resume()
    }
}
