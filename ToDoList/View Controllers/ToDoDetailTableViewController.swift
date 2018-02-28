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

    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
        
        updateCompleteButton()
        
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
        updateCompleteButton()
    }
    
    func updateSaveButton(){
        let title = titleTextField.text ?? ""
        
        saveBarButton.isEnabled = !title.isEmpty
       
    }
    
    func updateCompleteButton(){
        
        if saveBarButton.isEnabled == true {
            isCompleteButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
        }else {
            isCompleteButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
        }
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
    
    
    
    
 
   

}
