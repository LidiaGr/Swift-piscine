//
//  MyCollectionViewCell.swift
//  day03
//
//  Created by Lidia Grigoreva on 19.06.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var tImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    var spinner: UIActivityIndicatorView! = {
        let loginSpinner = UIActivityIndicatorView(style: .medium)
        loginSpinner.color = .white
        loginSpinner.translatesAutoresizingMaskIntoConstraints = false
        loginSpinner.hidesWhenStopped = true
        return loginSpinner
    }()
    
    
    // MARK: - Public API
    var imageURL: URL? {
        didSet {
            tImage?.image = nil
            updateUI()
        }
    }
    
    private func updateUI() {
        if let url = imageURL {
            spinner?.startAnimating()
            DispatchQueue.global(qos: .utility).async {
                let contentsOfURL = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if url == self.imageURL {
                        if let imageData = contentsOfURL {
                            self.tImage?.image = UIImage(data: imageData)
                        }
                        self.spinner?.stopAnimating()
                    }
                }
            }
        }
    }
    
    
    //    private func updateUI() {
    ////          print("fetching image")
    //          if let url = imageURL {
    //
    //              let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
    //                  guard let data = data else {
    //                      return
    //                  }
    //                  // maybe try dispatch to main
    //                  DispatchQueue.main.async {
    //                      self.tImage.image = UIImage(data: data)
    //                  }
    //              }
    //              task.resume()
    //          }
    //      }
    
}


