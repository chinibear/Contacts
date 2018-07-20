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
    @IBOutlet weak var isFaveButton: UIButton!
    
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
        isFaveButton.setTitle(isFaveText, for: .normal)
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
