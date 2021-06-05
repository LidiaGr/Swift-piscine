//
//  ViewController.swift
//  day00
//
//  Created by Lidia Grigoreva on 04/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

//MARK: ex00
//class ViewController: UIViewController {
//
//
//    fileprivate func createButton() -> UIButton {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//        button.setTitle("Click me", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let button = createButton()
//        self.view.addSubview(button);
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//    }
//
//    @objc func buttonAction(sender: UIButton!) {
//      print("Hello World !")
//    }
//}



//MARK: ex01
class ViewController: UIViewController {
    
    private let lable = UILabel()
    private let button = UIButton()
    private var flag = Bool()

    fileprivate let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    private func createLable() {
        lable.text = "Hello World"
        lable.textAlignment = .center
    }
    
    private func createButton() {
        button.setTitle("Click me", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(changeLableValue), for: .touchUpInside)
    }
    
    @objc func changeLableValue(target: UIButton!) {
        if (flag) {
            lable.text = "Hello World"
        } else {
            lable.text = "Surprize"
        }
        flag.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLable()
        createButton()
        
        stackView.addArrangedSubview(lable)
        stackView.addArrangedSubview(button)
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

