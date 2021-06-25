//
//  ViewController.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

import UIKit

class ViewController: UIViewController {
    var apiController: APIController?
    var visitsArr: [Visit] = []
    var token : String? {
        willSet {
            self.apiController = APIController(apiDelegate: self, apiToken: newValue!)
            updateUI()
        }
    }
    
    var tableView = UITableView()
    
    var search: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.hidesNavigationBarDuringPresentation = false
        search.searchBar.placeholder = "Enter nickname from intra"
        search.searchBar.returnKeyType = .done
        return search
    }()
    
    var spinner: UIActivityIndicatorView! = {
        let loginSpinner = UIActivityIndicatorView(style: .large)
        loginSpinner.color = .black
        loginSpinner.translatesAutoresizingMaskIntoConstraints = false
        loginSpinner.hidesWhenStopped = true
        return loginSpinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Trying to connect to the server..."
        
        view.addSubview(spinner)
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.startAnimating()
        
        getAccessToken()
    }
    
    func updateUI() {
        DispatchQueue.main.async { [self] in
            spinner.stopAnimating()
            self.title = "Station Sessions History"
            
            search.searchBar.delegate = self
            search.delegate = self
            search.searchResultsUpdater = self
            navigationItem.searchController = search
            navigationItem.hidesSearchBarWhenScrolling = false
            
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visitsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let theVisit = visitsArr[indexPath.row]
        cell.dateLable.text = "\(theVisit.date)"
        cell.timeLable.text = "\(theVisit.begin_at) - \(theVisit.end_at)"
        cell.hostLable.text = "\(theVisit.host)"
        return cell
    }
}

extension ViewController: APIIntra42Delegate {
    func processData(visits: [Visit]) {
        visitsArr = visits
        DispatchQueue.main.async { [weak self] in
            if self?.tableView.numberOfRows(inSection: 0) != 0 {
                self?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0) , at: UITableView.ScrollPosition.top, animated: true)
            }
            self?.tableView.reloadData()
            self?.spinner.stopAnimating()
        }
    }
    
    func errorOccured(error: NSError) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "User \(error.userInfo["username"] ?? "") not found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog(error.localizedDescription)
            }))
            self.present(alert, animated: true, completion: nil)
            self.spinner.stopAnimating()
            self.visitsArr = []
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.spinner?.startAnimating()
        guard let text = search.searchBar.text?.lowercased() else { return }
        self.apiController?.searchVisits(username: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if spinner.isAnimating {
            self.spinner.stopAnimating()
        }
        self.visitsArr = []
        self.tableView.reloadData()
    }
}

extension ViewController {
    func getAccessToken() {
        let UID = "be7059d0939c5aa48803d0c69f6372a85794ac39ab90814f338766f9e25c4f4a"
        let SECRET = "27d4796f7fc88b986b6d0052a13560d3719950157344d21456a5bd5016a387ea"
        let url = URL(string: "https://api.intra.42.fr/oauth/token".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        let data = ["grant_type":"client_credentials", "client_id":"\(UID)", "client_secret":"\(SECRET)"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: data, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print(err)
                return
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print(response!)
                return
            }
            if let recievedData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: recievedData) as! Dictionary<String, AnyObject>
                    guard let token = json["access_token"] as? String else { return }
                    self.token = token
                    print("Token successfully received")
                } catch let err {
                    print(err)
                }
            }
        }
        
        dataTask.resume()
    }
}


