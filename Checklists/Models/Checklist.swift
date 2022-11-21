//
//  Checklist.swift
//  Checklists
//
//  Created by Mario Jackson on 01.11.22.
//

import UIKit

class Checklist: NSObject, Codable {
    var name: String
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
