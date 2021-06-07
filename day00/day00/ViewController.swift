//
//  ViewController.swift
//  day00
//
//  Created by Lidia Grigoreva on 04/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   private let resultLable = UILabel()
   private var input = String();
   private var currentOperation = String();
   private var firstArg : Int?
   private var secondArg : Int?
   private var error = Bool();
   
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
      let button = UIButton() //(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
      button.setTitle(value, for: .normal)
      button.backgroundColor = bgColor
      button.setTitleColor(textColor, for: .normal)
      //        button.layer.cornerRadius = 5
      button.addTarget(self, action: #selector(changeLableValue), for: .touchUpInside)
      
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }
   
   fileprivate let stackView: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillEqually
      stack.axis = .vertical
      stack.spacing = 5
      return stack
   }()
   
   fileprivate let buttonView: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillProportionally
      stack.axis = .horizontal
      stack.spacing = 5
      return stack
   }()
   
   fileprivate let stackNumView: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillEqually
      stack.axis = .vertical
      stack.spacing = 5
      return stack
   }()
   
   fileprivate let stackOpView: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillEqually
      stack.axis = .vertical
      stack.spacing = 5
      return stack
   }()
   
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
   
   fileprivate let stackOpSubView1: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillEqually
      stack.axis = .horizontal
      stack.spacing = 5
      return stack
   }()
   
   fileprivate let stackOpSubView2: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillEqually
      stack.axis = .horizontal
      stack.spacing = 5
      return stack
   }()
   
   fileprivate let stackOpSubView3: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillEqually
      stack.axis = .horizontal
      stack.spacing = 5
      return stack
   }()
   
   fileprivate let stackOpSubView4: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.distribution = .fillEqually
      stack.axis = .horizontal
      stack.spacing = 5
      return stack
   }()
   
   private func fillLable() {
      resultLable.text = "0"
      resultLable.textColor = UIColor.white
      resultLable.textAlignment = .right
   }
   
   fileprivate func fillNums() {
      stackSubView1.addArrangedSubview(numButton7)
      stackSubView1.addArrangedSubview(numButton8)
      stackSubView1.addArrangedSubview(numButton9)
      
      stackSubView2.addArrangedSubview(numButton4)
      stackSubView2.addArrangedSubview(numButton5)
      stackSubView2.addArrangedSubview(numButton6)
      
      stackSubView3.addArrangedSubview(numButton1)
      stackSubView3.addArrangedSubview(numButton2)
      stackSubView3.addArrangedSubview(numButton3)
      
      stackSubView4.addArrangedSubview(numButton0)
   }
   
   func fillOperations() {
      stackOpSubView1.addArrangedSubview(opButtonAc)
      stackOpSubView1.addArrangedSubview(opButtonNeg)
      
      stackOpSubView2.addArrangedSubview(opButtonSum)
      stackOpSubView2.addArrangedSubview(opButtonMul)
      
      stackOpSubView3.addArrangedSubview(opButtonDif)
      stackOpSubView3.addArrangedSubview(opButtonDiv)
      
      stackOpSubView4.addArrangedSubview(opButtonEq)
      
   }
   
   func fillOpView() {
      stackOpView.addArrangedSubview(stackOpSubView1)
      stackOpView.addArrangedSubview(stackOpSubView2)
      stackOpView.addArrangedSubview(stackOpSubView3)
      stackOpView.addArrangedSubview(stackOpSubView4)
   }
   
   
   func fillNumView() {
      stackNumView.addArrangedSubview(stackSubView1)
      stackNumView.addArrangedSubview(stackSubView2)
      stackNumView.addArrangedSubview(stackSubView3)
      stackNumView.addArrangedSubview(stackSubView4)
   }
   
   func fillButtonView() {
      buttonView.addArrangedSubview(stackNumView)
      buttonView.addArrangedSubview(stackOpView)
   }
   
   func fillStackView() {
      stackView.addArrangedSubview(resultLable)
      stackView.addArrangedSubview(buttonView)
   }
   
   func handleAC() {
      firstArg = nil;
      secondArg = nil;
      currentOperation.removeAll();
      input.removeAll()
      resultLable.text = "0"
   }
   
   func operationPressed(button: String) -> Bool {
      if (button == "+" || button == "-"
         || button == "*" || button == "/"
         || button == "="
         || button == "NEG" || button == "AC") {
         return true
      }
      return false
   }
   
   func makeOperation() {
      switch currentOperation {
      case "+":
         firstArg! += secondArg!
      case "-":
         firstArg! -= secondArg!
      case "*":
         firstArg! *= secondArg!
      case "/":
         if (secondArg != 0) {
            firstArg! /= secondArg!
         } else {
            error = true
         }
      default:
         break
      }
      if String(firstArg!).count > 15 {
         error = true
      }
      secondArg = nil;
      currentOperation.removeAll()
   }
   
   @objc func changeLableValue(target: UIButton!) {
//      print(target.currentTitle!, separator: " ", terminator: "")
      let val = target.currentTitle!
      
      if val == "AC" {
         handleAC()
         return
      }
      
      if !operationPressed(button: val) {
         input += val
         resultLable.text = input
      } else {
         if !input.isEmpty && firstArg == nil {
            firstArg = Int(input)
            input.removeAll()
            if val == "NEG" {
               firstArg! *= -1;
               resultLable.text = String(firstArg!)
            }
         }
         
         if !input.isEmpty {
            secondArg = Int(input)
            input.removeAll()
            if val == "NEG" {
               secondArg! *= -1;
               resultLable.text = String(secondArg!)
            }
         }
         
         if val != "NEG" && val != "=" {
            if secondArg == nil {
               currentOperation = val
            }
         }
         
         if firstArg != nil && secondArg != nil {
//            print("\n firstArg: \(firstArg!), operation: \(currentOperation), secondArg: \(secondArg!)")
            makeOperation()
            if val != "=" && val != "NEG" {
               currentOperation = val
            }
            if (!error) {
               resultLable.text = String(firstArg!)
            } else {
               error = false
               handleAC()
               resultLable.text = "impossible"
            }
//            print("firstArg: \(firstArg ?? nil), operation: \(currentOperation), secondArg: \(secondArg ?? nil)")
         }
      }
   
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.addSubview(stackView)
      
      fillStackView()
      
      fillLable()
      fillButtonView()
      
      fillOpView()
      fillNumView()
      
      fillNums()
      fillOperations()
      
      
      view.backgroundColor = UIColor.darkGray
      stackView.translatesAutoresizingMaskIntoConstraints = false
      
      stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9).isActive = true
      stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
   }
}
