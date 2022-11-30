//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Mario Jackson on 11/10/22.
//

import UIKit

protocol ListDetailViewControllerDelegate: AnyObject {
    func listDetailViewControllerDidCancel(
        _ controller: ListDetailViewController
    )
    
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishAdding checklist: Checklist
    )
    
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishEditing checklist: Checklist
    )
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var iconImage: UIImageView!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    var checklistToEdit: Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let existingChecklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = existingChecklist.name
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let existingChecklist = checklistToEdit {
            existingChecklist.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: existingChecklist)
            return
        }
        
        let checklist = Checklist(name: textField.text!)
        delegate?.listDetailViewController(self, didFinishAdding: checklist)
    }
    
    // MARK: - Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let originalText = textField.text!
        let stringRange = Range(range, in: originalText)!
        
        let text = originalText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !text.isEmpty
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
    
    // MARK - Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.section == 1 ? indexPath : nil
    }
}
