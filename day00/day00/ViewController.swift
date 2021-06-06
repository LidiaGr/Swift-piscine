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
//class ViewController: UIViewController {
//
//    private let lable = UILabel()
//    private let button = UIButton()
//    private var flag = Bool()
//
//    fileprivate let stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.distribution = .fillEqually
//        stack.axis = .vertical
//        return stack
//    }()
//
//    private func createLable() {
//        lable.text = "Hello World"
//        lable.textAlignment = .center
//    }
//
//    private func createButton() {
//        button.setTitle("Click me", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//        button.addTarget(self, action: #selector(changeLableValue), for: .touchUpInside)
//    }
//
//    @objc func changeLableValue(target: UIButton!) {
//        if (flag) {
//            lable.text = "Hello World"
//        } else {
//            lable.text = "Surprize"
//        }
//        flag.toggle()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        createLable()
//        createButton()
//
//        stackView.addArrangedSubview(lable)
//        stackView.addArrangedSubview(button)
//        view.addSubview(stackView)
//
//        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    }
//}


//MARK: Ex02
class ViewController: UIViewController {
    private let result = UILabel()

    private var empty1 : UIButton { createButton(value: "", bgColor: UIColor.darkGray, textColor: UIColor.darkGray) }
    private var empty2 : UIButton { createButton(value: "", bgColor: UIColor.darkGray, textColor: UIColor.darkGray) }
    private var empty3 : UIButton { createButton(value: "", bgColor: UIColor.darkGray, textColor: UIColor.darkGray) }
    
    private var numButton0 : UIButton { createButton(value: "0", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton1 : UIButton { createButton(value: "1", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton2 : UIButton { createButton(value: "2", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton3 : UIButton { createButton(value: "3", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton4 : UIButton { createButton(value: "4", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton5 : UIButton { createButton(value: "5", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton6 : UIButton { createButton(value: "6", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton7 : UIButton { createButton(value: "7", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton8 : UIButton { createButton(value: "8", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    private var numButton9 : UIButton { createButton(value: "9", bgColor: UIColor.systemGray, textColor: UIColor.white) }
    
    private var opButtonAc  : UIButton { createButton(value: "AC",  bgColor: UIColor.systemOrange, textColor: UIColor.black) }
    private var opButtonNeg : UIButton { createButton(value: "NEG", bgColor: UIColor.systemOrange, textColor: UIColor.black) }
    private var opButtonSum : UIButton { createButton(value: "+",   bgColor: UIColor.systemOrange, textColor: UIColor.black) }
    private var opButtonDif : UIButton { createButton(value: "-",   bgColor: UIColor.systemOrange, textColor: UIColor.black) }
    private var opButtonMul : UIButton { createButton(value: "*",   bgColor: UIColor.systemOrange, textColor: UIColor.black) }
    private var opButtonDiv : UIButton { createButton(value: "/",   bgColor: UIColor.systemOrange, textColor: UIColor.black) }
    private var opButtonEq  : UIButton { createButton(value: "=",   bgColor: UIColor.systemOrange, textColor: UIColor.black) }

    fileprivate func createButton(value: String, bgColor: UIColor, textColor: UIColor) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        button.setTitle(value, for: .normal)
        button.backgroundColor = bgColor
        button.setTitleColor(textColor, for: .normal)
//        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(changeLableValue), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc func changeLableValue(target: UIButton!) {
        result.text = target.currentTitle
    }
    
    fileprivate let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()

//    fileprivate let stackNumView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.distribution = .fillEqually
//        stack.axis = .vertical
//        stack.spacing = 5
//        return stack
//    }()
    
    fileprivate let stackSubView1: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    fileprivate let stackSubView2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    fileprivate let stackSubView3: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    fileprivate let stackSubView4: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    private func createLable() {
        result.text = "0"
        result.textColor = UIColor.white
        result.textAlignment = .right
    }
    
    fileprivate func createButtons() {
        stackSubView1.addArrangedSubview(numButton1)
        stackSubView1.addArrangedSubview(numButton2)
        stackSubView1.addArrangedSubview(numButton3)
        stackSubView1.addArrangedSubview(opButtonAc)
        stackSubView1.addArrangedSubview(opButtonNeg)
        
        stackSubView2.addArrangedSubview(numButton4)
        stackSubView2.addArrangedSubview(numButton5)
        stackSubView2.addArrangedSubview(numButton6)
        stackSubView2.addArrangedSubview(opButtonSum)
        stackSubView2.addArrangedSubview(opButtonMul)
        
        stackSubView3.addArrangedSubview(numButton7)
        stackSubView3.addArrangedSubview(numButton8)
        stackSubView3.addArrangedSubview(numButton9)
        stackSubView3.addArrangedSubview(opButtonDif)
        stackSubView3.addArrangedSubview(opButtonDiv)
        
        stackSubView4.addArrangedSubview(empty1)
        stackSubView4.addArrangedSubview(numButton0)
        stackSubView4.addArrangedSubview(empty2)
        stackSubView4.addArrangedSubview(opButtonEq)
        stackSubView4.addArrangedSubview(empty3)
        
//        stackNumView.addArrangedSubview(stackSubView1)
//        stackNumView.addArrangedSubview(stackSubView2)
//        stackNumView.addArrangedSubview(stackSubView3)
//        stackNumView.addArrangedSubview(stackSubView4)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLable()
        createButtons()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(result)
//        stackView.addArrangedSubview(stackNumView)
        stackView.addArrangedSubview(stackSubView1)
        stackView.addArrangedSubview(stackSubView2)
        stackView.addArrangedSubview(stackSubView3)
        stackView.addArrangedSubview(stackSubView4)
        
        view.backgroundColor = UIColor.darkGray
        stackView.translatesAutoresizingMaskIntoConstraints = false
                    
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
    }
}
