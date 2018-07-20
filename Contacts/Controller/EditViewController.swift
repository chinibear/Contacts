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
    @IBOutlet weak var isFaveButton: UIButton!
    
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
        isFaveButton.setTitle(isFaveText, for: .normal)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        contact.name = nameTextField.text!
        contact.contactNo = contactNoTextField.text!
        
        delegate?.editContact(contact: Contact(name: contact.name, contactNo: contact.contactNo, isFave: contact.isFave), indexPath: indexPath)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func isFaveButtonPressed(_ sender: UIButton) {
        if isFaveButton.isSelected {
            contact.isFave = false
            isFaveButton.isSelected = false
            isFaveButton.setTitle("☆", for: .normal)
        } else {
            contact.isFave = true
            isFaveButton.isSelected = true
            isFaveButton.setTitle("★", for: .normal)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
