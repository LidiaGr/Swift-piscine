//
//  SecondVC.swift
//  day02
//
//  Created by Lidia Grigoreva on 15/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    let nameField = UITextField()
    let datePicker = UIDatePicker()
    let descriptionField = UITextView()
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "Create a Note"
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(done))
        self.navigationItem.rightBarButtonItem = doneItem
        
        setup()
    }
    
    func setup() {
        setStackView()
        setNameField()
        setDatePicker()
        setDescriptionField()
    }
    
    @objc func done() {
        print("Name: \(nameField.text ?? "")")
        print("Date: \(datePicker.date.toString())")
        print("Description: \(descriptionField.text ?? "")")
        
        if !nameField.text!.isEmpty {
            let newCharacter = Character(name: nameField.text!, description: descriptionField.text ?? "", date: datePicker.date.toString())
            CharacterAPI.pushCharacter(new: newCharacter)
        }
        
//        for character in CharacterAPI.getCharacters() {
//            print(character.name)
//        }
        
        navigationController?.popViewController(animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//MARK: StackView
extension SecondVC {
    func setStackView() {
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

//MARK: NameField
extension SecondVC: UITextFieldDelegate {
    func setNameField() {
        nameField.placeholder = "Name"
        nameField.font = UIFont.systemFont(ofSize: 20)
        nameField.borderStyle = UITextField.BorderStyle.roundedRect
        nameField.autocorrectionType = UITextAutocorrectionType.no
        nameField.keyboardType = UIKeyboardType.default
        nameField.returnKeyType = UIReturnKeyType.done
        nameField.clearButtonMode = UITextField.ViewMode.whileEditing
        nameField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        nameField.delegate = self
        
        stackView.addArrangedSubview(nameField)
    }
}

//MARK: DatePicker
extension SecondVC {
    func setDatePicker() {
        datePicker.timeZone = NSTimeZone.local
        datePicker.minimumDate = Date()
        
        stackView.addArrangedSubview(datePicker)
    }
}

//MARK: DescriptionField
extension SecondVC:  UITextViewDelegate {
    func setDescriptionField() {
        descriptionField.text = "Description"
        descriptionField.font = UIFont.systemFont(ofSize: 20)
        descriptionField.backgroundColor = .white;
        descriptionField.textColor = .lightGray;
        descriptionField.isScrollEnabled = true;
        descriptionField.isEditable = true;
        descriptionField.delegate = self
        
        stackView.addArrangedSubview(descriptionField)
        
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
        return true
    }
}
