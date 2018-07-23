//
//  AddViewController.swift
//  Contacts
//
//  Created by Failyn Kaye Sedik on 7/19/18.
//  Copyright © 2018 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

protocol AddContactDelegate {
    func addContact(name: String, contactNo: String, isFave: Bool)
}

class AddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactNoTextField: UITextField!
    var isFaveButton: UIBarButtonItem?
    
    var name: String = ""
    var contactNo: String = ""
    var isFave: Bool = false
    
    var delegate: AddContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize right button on navbar
        isFaveButton = UIBarButtonItem(title: "☆", style: .done, target: self, action: #selector(isFaveButtonPressed))
        self.navigationItem.rightBarButtonItem = isFaveButton
    }
    
    @objc func isFaveButtonPressed() {
        if isFave == false {
            isFave = true
            isFaveButton?.title = "★"
        } else {
            isFave = false
            isFaveButton?.title = "☆"
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        name = nameTextField.text!
        contactNo = contactNoTextField.text!
        
        delegate?.addContact(name: name, contactNo: contactNo, isFave: isFave)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
