//
//  Contact.swift
//  Contacts
//
//  Created by Failyn Kaye Sedik on 7/19/18.
//  Copyright © 2018 Failyn Kaye Sedik. All rights reserved.
//

import Foundation

class Contact {
    var name: String = ""
    var contactNo: String = ""
    var isFave: Bool = false
    
    init(name: String, contactNo: String, isFave: Bool) {
        self.name = name
        self.contactNo = contactNo
        self.isFave = isFave
    }
}
