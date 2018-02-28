# ToDoList

“Part One: Project Planning”
“Part Two: Set Up Project and Display Models”
“Part Three: Add and Delete Controls”
“Part Four: Static Table View Interface”
“Part Five: : Connect the Static Table View to Code”
“Dismiss Keyboard on Return :
    “@IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    ”
“Part Six: Create and Save the Model”
“Part Seven: Editing Details”
“Part Eight: Create a Custom UITableViewCell”


“Above the definition of your cell subclass, define a protocol with a method that passes the cell back to the delegate:
 
 @objc protocol ToDoCellDelegate: class {
 func checkmarkTapped(sender: ToDoCell)
 }
 ”
 
 “Add a delegate property to your cell subclass so that the cell has something to inform:
 
 var delegate: ToDoCellDelegate?
 
 In the action tied to the checkmark button, inform the delegate that the button tap has occurred, passing in self as the parameter to the method:
 
 @IBAction func completeButtonTapped() {
 ”
 “delegate?.checkmarkTapped(sender: self)
 }
 
 The cell's delegate should be the table view controller, which doesn't conform to the protocol you defined earlier. Update the view controller's class definition so that it can be set as the delegate:
 
 class ToDoTableViewController: UITableViewController
 ToDoCellDelegate
 
 To satisfy the conditions of the protocol, this view controller must implement all of its methods. Since there's only one method defined in the protocol, you can add the method declaration, but leave the method body blank:
 
 func checkmarkTapped(sender: ToDoCell) {
 
 }
 ”
 
 “Whenever a cell is dequeued, the table view controller should set itself as the cell's delegate. Locate the tableView(_ tableView:, cellForRowAt indexPath:) method, and set the delegate property of the cell accordingly:
 
 cell.delegate = self”
 
 "Part Nine: Codable"
 
 
