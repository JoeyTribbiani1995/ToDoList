//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Dũng Võ on 2/28/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {

    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    let dueDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    var isDueDatePickerShown : Bool = false {
        didSet{
            dueDatePicker.isHidden = !isDueDatePickerShown
        }
    }
    
    var toDo : ToDo?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
        
        dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        updateDueDateLabel(date: dueDatePicker.date)
        
        updateViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func datePIckerValueChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    func updateSaveButton(){
        let title = titleTextField.text ?? ""
        
        saveBarButton.isEnabled = !title.isEmpty
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    func updateDueDateLabel(date : Date){
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let normalCell = CGFloat(44.0)
        let largeCell = CGFloat(200.0)
        let hideCell = CGFloat(0.0)
        
        switch (indexPath) {
        case [1,1]:
            return isDueDatePickerShown ? largeCell : hideCell
        case [2,0]:
            return largeCell
        default:
            return normalCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath) {
        case [1,0]:
            isDueDatePickerShown = !isDueDatePickerShown
            
            tableView.beginUpdates()
            tableView.endUpdates()
       
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {
            return
        }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let notes = notesTextView.text
        let date = dueDatePicker.date
        
        toDo = ToDo(title: title, isComplete: isComplete, dueDate: date, notes: notes!)
    }
    
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        toDo = nil
        performSegue(withIdentifier: "saveUnwind", sender: self)
    }
    
    func updateViews(){
        if let toDo = toDo {
            titleTextField.text = toDo.title
            isCompleteButton.isSelected = toDo.isComplete
            dueDatePicker.date = toDo.dueDate
            notesTextView.text = toDo.notes
        }else {
            dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        }
    }
    
    
 
   

}
