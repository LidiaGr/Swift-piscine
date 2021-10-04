//
//  ViewController.swift
//  day09
//
//  Created by Lidia Grigoreva on 13.07.2021.
//

import UIKit
import LocalAuthentication
import ttarsha2021

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        authentication()
    }

    private func authentication() {
        let context = LAContext()

        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
             let reason = "Identify yourself!"

             context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                 [weak self] success, authenticationError in

                 DispatchQueue.main.async {
                     if success {
                        print("success")
                        self!.view.backgroundColor = .green
                     } else {
                        print("failure")
                        self?.authentication()
                         // error
                     }
                 }
             }
         } else {
            print("enter password")
             // no biometry
         }
    }

}
