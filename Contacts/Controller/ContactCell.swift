//
//  ContactCell.swift
//  Contacts
//
//  Created by Failyn Kaye Sedik on 7/19/18.
//  Copyright © 2018 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var cellNameLabel: UILabel!
    
    func setContactName(name: String) {
        cellNameLabel.text = name
    }

}
