//
//  CharacterTableViewCell.swift
//  day02
//
//  Created by Lidia Grigoreva on 17.06.2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

class CharacterTableViewCell : UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(deathDate)
        self.contentView.addSubview(deathDescription)
        
        nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
            nameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true

        deathDate.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
            deathDate.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true

        deathDescription.topAnchor.constraint(equalTo: self.deathDate.bottomAnchor).isActive = true
            deathDescription.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deathDescription : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deathDate : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
