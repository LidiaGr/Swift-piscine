//
//  ViewController.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

import UIKit

class ViewController: UIViewController {
    let UID = "be7059d0939c5aa48803d0c69f6372a85794ac39ab90814f338766f9e25c4f4a"
    let SECRET = "27d4796f7fc88b986b6d0052a13560d3719950157344d21456a5bd5016a387ea"
   
    var apiController: APIController?
    var token : String? {
        willSet {
            if newValue != "" {
                self.apiController = APIController(apiDelegate: self, apiToken: newValue!)
                self.apiController?.searchVisits(username: "ttarsha")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAccessToken()
    }
    
    func requestAccessToken() {
        let postData = NSMutableData(data: "grant_type=client_credentials".data(using: String.Encoding.utf8)!)
        postData.append("&client_id=\(UID)".data(using: String.Encoding.utf8)!)
        postData.append("&client_secret=\(SECRET)".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.intra.42.fr/oauth/token")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let err = error {
                print("Error 1: \(err)")
            } else if let recievedData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: recievedData) as! Dictionary<String, AnyObject>
                    guard let token = json["access_token"] as? String else { return }
                    self.token = token
                    print(json)
                } catch let err {
                    print("Error 2: \(err)")
                }
            }
        })
        
        dataTask.resume()
    }
}

extension ViewController: APIIntra42Delegate {
    func processData(visit: [Visit]) {
        print("process data")
    }
    
    func errorOccured(error: NSError) {
        print(error)
    }
    
    
}
