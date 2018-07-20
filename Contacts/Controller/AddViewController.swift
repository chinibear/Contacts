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
    @IBOutlet weak var isFaveButton: UIButton!
    
    var name: String = ""
    var contactNo: String = ""
    var isFave: Bool = false
    
    var delegate: AddContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        name = nameTextField.text!
        contactNo = contactNoTextField.text!
        
        delegate?.addContact(name: name, contactNo: contactNo, isFave: isFave)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func isFaveButtonPressed(_ sender: UIButton) {
        if isFaveButton.isSelected {
            isFave = false
            isFaveButton.isSelected = false
            isFaveButton.setTitle("☆", for: .normal)
        } else {
            isFave = true
            isFaveButton.isSelected = true
            isFaveButton.setTitle("★", for: .normal)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
