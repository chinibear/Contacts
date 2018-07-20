//
//  ViewController.swift
//  Contacts
//
//  Created by Failyn Kaye Sedik on 7/19/18.
//  Copyright © 2018 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddContactDelegate, EditContactDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts.append(Contact(name: "Fai", contactNo: "09123456789", isFave: true))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddContact" {
            let addVC = segue.destination as! AddViewController
            addVC.delegate = self
        }
    }

    // Table Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        
        cell.setContactName(name: contact.name)
        
        return cell
    }
    
    // View Contact
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        let readVC = storyboard?.instantiateViewController(withIdentifier: "ReadViewController") as! ReadViewController
        
        readVC.contact = contact
        present(readVC, animated: true, completion: nil)
    }
    
    // Add Contact
    func addContact(name: String, contactNo: String, isFave: Bool) {
        let contact = Contact(name: name, contactNo: contactNo, isFave: isFave)
        let indexPath = IndexPath(row: contacts.count, section: 0)
        
        contacts.append(contact)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    // Edit & Delete
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let contact = contacts[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.deleteContact(indexPath: indexPath)
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            let editVC = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            
            editVC.contact = contact
            editVC.indexPath = indexPath
            
            self.present(editVC, animated: true, completion: nil)
        }
        
        return [deleteAction, editAction]
    }
    
    // Edit Contact
    func editContact(contact: Contact, indexPath: IndexPath) {
        contacts[indexPath.row].name = contact.name
        contacts[indexPath.row].contactNo = contact.contactNo
        contacts[indexPath.row].isFave = contact.isFave
        
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
    }
    
    // Delete Contact
    func deleteContact(indexPath: IndexPath) {
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this contact?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.contacts.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}

