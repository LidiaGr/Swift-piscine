//
//  CharacterTableViewCell.swift
//  day02
//
//  Created by Lidia Grigoreva on 17.06.2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

class CharacterTableViewCell : UITableViewCell {
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deathDate : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deathDescription : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(deathDate)
        self.contentView.addSubview(deathDescription)
        
        //Horizontal Position for each label
        nameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        deathDate.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        deathDate.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        deathDescription.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        deathDescription.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        
        //Vertical Position for each label
        nameLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: deathDescription.lastBaselineAnchor, multiplier: 1).isActive = true
        
        deathDate.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: nameLabel.lastBaselineAnchor, multiplier: 1).isActive = true
        deathDescription.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: deathDate.lastBaselineAnchor, multiplier: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
