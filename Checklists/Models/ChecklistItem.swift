//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Mario Jackson on 9/26/22.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var itemID: Int
    var text: String
    var checked: Bool
    var dueDate: Date
    var shouldRemind: Bool
    
    init(text: String, checked: Bool = false) {
        self.text = text
        self.checked = checked
        self.dueDate = Date()
        self.shouldRemind = false
        itemID = DataModel.nextChecklistItemID()
    }
}
