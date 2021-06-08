//
//  ViewController.swift
//  day00
//
//  Created by Lidia Grigoreva on 04/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   private var input = String()
   private var currentOperation = String()
   private var firstArg : Int?
   private var secondArg : Int?
   private var error = Bool()
   
   private let resultLable : UILabel = {
      let lable = UILabel()
      lable.text = "0"
      lable.textColor = UIColor.white
      lable.textAlignment = .right
      return lable
   }()
   
   private var numButton0 : UIButton { createNumButton(value: "0") }
   private var numButton1 : UIButton { createNumButton(value: "1") }
   private var numButton2 : UIButton { createNumButton(value: "2") }
   private var numButton3 : UIButton { createNumButton(value: "3") }
   private var numButton4 : UIButton { createNumButton(value: "4") }
   private var numButton5 : UIButton { createNumButton(value: "5") }
   private var numButton6 : UIButton { createNumButton(value: "6") }
   private var numButton7 : UIButton { createNumButton(value: "7") }
   private var numButton8 : UIButton { createNumButton(value: "8") }
   private var numButton9 : UIButton { createNumButton(value: "9") }
   
   private var opButtonAc  : UIButton { createOpButton(value: "AC" ) }
   private var opButtonNeg : UIButton { createOpButton(value: "NEG") }
   private var opButtonSum : UIButton { createOpButton(value: "+"  ) }
   private var opButtonDif : UIButton { createOpButton(value: "-"  ) }
   private var opButtonMul : UIButton { createOpButton(value: "*"  ) }
   private var opButtonDiv : UIButton { createOpButton(value: "/"  ) }
   private var opButtonEq  : UIButton { createOpButton(value: "="  ) }
   
   private func createNumButton(value: String) -> UIButton {
      let button = UIButton()
      button.setTitle(value, for: .normal)
      button.backgroundColor = UIColor.systemGray
      button.setTitleColor(UIColor.white, for: .normal)
      button.layer.cornerRadius = 2
      button.addTarget(self, action: #selector(numButtonPressed), for: .touchUpInside)
      
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }
   
   private func createOpButton(value: String) -> UIButton {
      let button = UIButton()
      button.setTitle(value, for: .normal)
      button.backgroundColor = UIColor.systemOrange
      button.setTitleColor(UIColor.black, for: .normal)
      button.layer.cornerRadius = 2
      button.addTarget(self, action: #selector(opButtonPressed), for: .touchUpInside)
      
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.addSubview(stackView)
      fillStackView()
   }
   
   private func handleAC() {
      firstArg = nil;
      secondArg = nil;
      currentOperation.removeAll();
      input.removeAll()
      resultLable.text = "0"
   }
   
   private func makeOperation() {
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
   
   private func fillOparendsAndOperationType(val: String) {
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
   }
   
   @objc private func numButtonPressed(target: UIButton!) {
      //print(target.currentTitle!, separator: " ", terminator: "")
      input += target.currentTitle!
      resultLable.text = input
   }
   
   @objc private func opButtonPressed(target: UIButton!) {
      //print(target.currentTitle!, separator: " ", terminator: "")
      let val = target.currentTitle!
      
      if val == "AC" {
         handleAC()
         return
      }
      
      fillOparendsAndOperationType(val: val)
      
      if firstArg != nil && secondArg != nil {
         //MARK: Debug
         //print("\n firstArg: \(firstArg!), operation: \(currentOperation), secondArg: \(secondArg!)")
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
         //print("firstArg: \(firstArg ?? nil), operation: \(currentOperation), secondArg: \(secondArg ?? nil)")
      }
   }
   
   private func fillNums() {
      stackNumSubView1.addArrangedSubview(numButton7)
      stackNumSubView1.addArrangedSubview(numButton8)
      stackNumSubView1.addArrangedSubview(numButton9)
      
      stackNumSubView2.addArrangedSubview(numButton4)
      stackNumSubView2.addArrangedSubview(numButton5)
      stackNumSubView2.addArrangedSubview(numButton6)
      
      stackNumSubView3.addArrangedSubview(numButton1)
      stackNumSubView3.addArrangedSubview(numButton2)
      stackNumSubView3.addArrangedSubview(numButton3)
      
      stackNumSubView4.addArrangedSubview(numButton0)
   }
   
   private func fillOperations() {
      stackOpSubView1.addArrangedSubview(opButtonAc)
      stackOpSubView1.addArrangedSubview(opButtonNeg)
      
      stackOpSubView2.addArrangedSubview(opButtonSum)
      stackOpSubView2.addArrangedSubview(opButtonMul)
      
      stackOpSubView3.addArrangedSubview(opButtonDif)
      stackOpSubView3.addArrangedSubview(opButtonDiv)
      
      stackOpSubView4.addArrangedSubview(opButtonEq)
      
   }
   
   private func fillOpView() {
      stackOpView.addArrangedSubview(stackOpSubView1)
      stackOpView.addArrangedSubview(stackOpSubView2)
      stackOpView.addArrangedSubview(stackOpSubView3)
      stackOpView.addArrangedSubview(stackOpSubView4)
   }
   
   private func fillNumView() {
      stackNumView.addArrangedSubview(stackNumSubView1)
      stackNumView.addArrangedSubview(stackNumSubView2)
      stackNumView.addArrangedSubview(stackNumSubView3)
      stackNumView.addArrangedSubview(stackNumSubView4)
   }
   
   private func fillStackView() {
      stackView.addArrangedSubview(resultLable)
      stackView.addArrangedSubview(buttonView)
      //in stackView
      buttonView.addArrangedSubview(stackNumView)
      buttonView.addArrangedSubview(stackOpView)
      
      //in buttonView
      fillNumView()
      fillOpView()
      
      //in stackNumView and stackOpView
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

fileprivate let stackNumSubView1: UIStackView = {
   let stack = UIStackView()
   stack.translatesAutoresizingMaskIntoConstraints = false
   stack.distribution = .fillEqually
   stack.axis = .horizontal
   stack.spacing = 5
   return stack
}()

fileprivate let stackNumSubView2: UIStackView = {
   let stack = UIStackView()
   stack.translatesAutoresizingMaskIntoConstraints = false
   stack.distribution = .fillEqually
   stack.axis = .horizontal
   stack.spacing = 5
   return stack
}()

fileprivate let stackNumSubView3: UIStackView = {
   let stack = UIStackView()
   stack.translatesAutoresizingMaskIntoConstraints = false
   stack.distribution = .fillEqually
   stack.axis = .horizontal
   stack.spacing = 5
   return stack
}()

fileprivate let stackNumSubView4: UIStackView = {
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
