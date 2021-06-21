//
//  SecondVC.swift
//  day03
//
//  Created by Lidia Grigoreva on 21.06.2021.
//
import UIKit

class SecondVC: UIViewController {
    private let scrollView = UIScrollView()
    private let cell: MyCollectionViewCell
    private let imageView : UIImageView = {
        let newImageView = UIImageView()
        newImageView.contentMode = .scaleAspectFill
        return newImageView
    }()
    
    init(cell: MyCollectionViewCell) {
        self.cell = cell
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.addSubview(scrollView)
        setupScrollViewConstaraints()
        
        imageView.image = cell.tImage.image
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        setupImageViewConstraints()
    }
    
    
    func setupScrollViewConstaraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    }
}


