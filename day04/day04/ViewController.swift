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
    
    let tableView = UITableView()
    var visitsArr: [Visit] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Visits"
        
        setupTableView()
        getAccessToken()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visitsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let theVisit = visitsArr[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(theVisit.description)"
//        cell.nameLabel.text = "\(theCharacter.name)"
//        cell.deathDate.text = "\(theCharacter.date)"
//        cell.deathDescription.numberOfLines = 0
//        cell.deathDescription.text = "\(theCharacter.description ?? "")"
        return cell
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
}

extension ViewController {
    func getAccessToken() {
        let url = URL(string: "https://api.intra.42.fr/oauth/token".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        let data = ["grant_type":"client_credentials", "client_id":"\(UID)", "client_secret":"\(SECRET)"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: data, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let err = error {
                print(err)
            } else if let recievedData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: recievedData) as! Dictionary<String, AnyObject>
                    guard let token = json["access_token"] as? String else { return }
                    self.token = token
                    print(json)
                } catch let err {
                    print(err)
                }
            }
        })
        
        dataTask.resume()
    }
}

extension ViewController: APIIntra42Delegate {
    func processData(visits: [Visit]) {
        visitsArr = visits
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func errorOccured(error: NSError) {
        print(error)
    }
}


