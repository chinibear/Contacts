//
//  EditViewController.swift
//  Contacts
//
//  Created by Failyn Kaye Sedik on 7/20/18.
//  Copyright © 2018 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

protocol EditContactDelegate {
    func editContact(contact: Contact, indexPath: IndexPath)
}

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactNoTextField: UITextField!
    var isFaveButton: UIBarButtonItem?
    
    var delegate: EditContactDelegate?
    var contact: Contact = Contact(name: "", contactNo: "", isFave: false)
    var isFaveText: String = ""
    var indexPath: IndexPath = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if contact.isFave {
            isFaveText = "★"
        } else {
            isFaveText = "☆"
        }
        
        nameTextField.text = contact.name
        contactNoTextField.text = contact.contactNo
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
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        contact.name = nameTextField.text!
        contact.contactNo = contactNoTextField.text!
        
        delegate?.editContact(contact: Contact(name: contact.name, contactNo: contact.contactNo, isFave: contact.isFave), indexPath: indexPath)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
