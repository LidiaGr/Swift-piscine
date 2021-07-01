//
//  ViewController.swift
//  day07
//
//  Created by Lidia Grigoreva on 01.07.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate {
    
    let button = UIButton()
    let label = UILabel()
    let textField = UITextField()
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    var token = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupStackView()
        setupTextField()
        setupButton()
        setupLabel()
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupTextField() {
        textField.placeholder = "Type your request"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        
        stackView.addArrangedSubview(textField)
    }
    
    func setupButton() {
        button.setTitle("Request", for: .normal)
        button.backgroundColor = UIColor.systemGray
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        stackView.addArrangedSubview(button)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        getTokenAndMakeRequest()
    }
    
    func setupLabel() {
        label.text = "Response"
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        stackView.addArrangedSubview(label)
    }
}

extension ViewController {
    
    func getTokenAndMakeRequest() {
        if token.isEmpty {
            let UID = "be7059d0939c5aa48803d0c69f6372a85794ac39ab90814f338766f9e25c4f4a"
            let SECRET = "27d4796f7fc88b986b6d0052a13560d3719950157344d21456a5bd5016a387ea"
            let data = ["grant_type":"client_credentials", "client_id":"\(UID)", "client_secret":"\(SECRET)"]
            
            Alamofire.request("https://api.intra.42.fr/oauth/token", method: .post, parameters: data, encoding: URLEncoding.httpBody).responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.result.value as? NSDictionary else { return }
                    self.token = data["access_token"] as! String
                    print("Token recieved: \(self.token)")
                    self.makeRequest()
                case .failure:
                    debugPrint(response)
                }
            }
        } else {
            makeRequest()
        }
        
    }
    
    func makeRequest() {
        self.label.text = ""
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(self.token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request("https://api.intra.42.fr/v2/users/\(textField.text?.lowercased() ?? "")", method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                switch response.response?.statusCode {
                case 200, 201:
                    if let theArray = response.result.value as? NSDictionary {
                        if theArray["location"] is NSNull {
                            self.label.text = "not avaliable"
                        } else {
                            self.label.text = "avaliable at \(theArray["location"]!)"
                        }
                    }
                case 401:
                    self.token = ""
                    self.getTokenAndMakeRequest()
                default:
                    debugPrint(response)
                }
            case .failure:
                debugPrint(response)
            }
        }
    }
}

