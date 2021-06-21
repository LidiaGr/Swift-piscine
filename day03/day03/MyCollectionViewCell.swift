//
//  MyCollectionViewCell.swift
//  day03
//
//  Created by Lidia Grigoreva on 19.06.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    weak var delegate: ViewController?
    
    var tImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = nil
        return imageView
    }()
    
    var spinner: UIActivityIndicatorView! = {
        let loginSpinner = UIActivityIndicatorView(style: .medium)
        loginSpinner.color = .systemBackground
        loginSpinner.translatesAutoresizingMaskIntoConstraints = false
        loginSpinner.hidesWhenStopped = true
        return loginSpinner
    }()
    
    var imageURL: URL? {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundView = tImage
        
        self.addSubview(spinner)
        self.spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
                        } else {
                            let alert = UIAlertController(title: "Error", message: "Cannot access to \(self.imageURL!)", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                                NSLog("Download from \(self.imageURL!) failed")
                            }))
                            self.delegate?.present(alert, animated: true, completion: nil)
                            self.tImage.image = UIImage(named: "error")
                        }
                        self.spinner?.stopAnimating()
                    }
                }
            }
        }
    }
}


