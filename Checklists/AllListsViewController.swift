//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Mario Jackson on 10/22/22.
//

import UIKit

class AllListsViewController: UITableViewController {
    let cellIdentifier = "ChecklistCell"
    
    var lists = [Checklist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // TODO: Remove test checklists
        lists.append(Checklist(name: "Birthdays"))
        lists.append(Checklist(name: "Groceries"))
        lists.append(Checklist(name: "Fitness"))
        lists.append(Checklist(name: "Mobile App"))
        lists.append(Checklist(name: "To Do"))
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let checklist = lists[indexPath.row]
        cell.textLabel?.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as? Checklist
        }
    }
}
