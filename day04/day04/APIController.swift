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
        let url = URL(string: "https://api.intra.42.fr/v2/users/\(username)/locations?per_page=100".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let err = error {
                self.delegate?.errorOccured(error: err as NSError)
                return
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print ("alert")
                self.delegate?.errorOccured(error: NSError(domain: "https://api.intra.42.fr/v2/users/\(username)", code: (response as! HTTPURLResponse).statusCode , userInfo: nil))
                return
            }
            if let recievedData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: recievedData)
                    guard let theArray = json as? NSArray else { return }
                    var visits: [Visit] = []
                    for theElement in theArray {
                        guard let theDecodedElement = theElement as? NSDictionary,
                              let hostId = theDecodedElement["host"] as? String,
                              let beginAt = theDecodedElement["begin_at"] as? String,
                              let endAt = theDecodedElement["end_at"] as? String
                        else { continue }
                        visits.append(Visit(host: hostId, begin_at: beginAt.toDate()!.toString(withFormat: "HH:mm"), end_at: endAt.toDate()!.toString(withFormat: "HH:mm"), date: beginAt.toDate()!.toString(withFormat: "d MMMM yyyy EEEE")))
                    }
                    self.delegate?.processData(visits: visits)
                } catch let err {
                    self.delegate?.errorOccured(error: err as NSError)
                }
            }
        }
        
        task.resume()
    }
}
