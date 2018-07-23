//
//  ReadViewController.swift
//  Contacts
//
//  Created by Failyn Kaye Sedik on 7/19/18.
//  Copyright © 2018 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactNoLabel: UILabel!
    var isFaveButton: UIBarButtonItem?
    
    var contact: Contact = Contact(name: "", contactNo: "", isFave: false)
    var isFaveText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if contact.isFave {
            isFaveText = "★"
            //isFaveButton.setTitleColor(.yellow, for: .normal)
        } else {
            isFaveText = "☆"
        }

        nameLabel.text = contact.name
        contactNoLabel.text = contact.contactNo
        isFaveButton = UIBarButtonItem(title: isFaveText, style: .done, target: self, action: #selector(isFaveButtonPressed))
        self.navigationItem.rightBarButtonItem = isFaveButton
    }
    
    @objc func isFaveButtonPressed() {
        if contact.isFave == false {
            contact.isFave = true
            isFaveButton?.title = "★"
        } else {
            contact.isFave = false
            isFaveButton?.title = "☆"
        }
    }
    
}
