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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
        
        dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        updateDueDateLabel(date: dueDatePicker.date)
        
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
        let notes = notesTextView.text ?? ""
        
        saveBarButton.isEnabled = !title.isEmpty && !notes.isEmpty
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    func updateDueDateLabel(date : Date){
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    
    
 
   

}
