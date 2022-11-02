//
//  Checklist.swift
//  Checklists
//
//  Created by Mario Jackson on 01.11.22.
//

import UIKit

class Checklist: NSObject {
    // Name of the checklist
    var name: String
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
