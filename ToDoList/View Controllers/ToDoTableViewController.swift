//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Dũng Võ on 2/28/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    
    var toDos = [ToDo]()
    var flagChangeBarButtonTitle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editBarButtonItem
        
        if let saveToDos = ToDo.loadToDos() {
            toDos = saveToDos
        }else {
            toDos = ToDo.loadSampleToDos()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")  else {
            fatalError("Could not dequeue a cell")
        }
        
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
//    @IBAction func editBarButtonItemTapped(_ sender: UIBarButtonItem) {
//        let tableViewEditingMode = tableView.isEditing
//        tableView.setEditing(!tableViewEditingMode, animated: true)
//       
//        if flagChangeBarButtonTitle {
//            editBarButtonItem.title =  "Done"
//            flagChangeBarButtonTitle = !flagChangeBarButtonTitle
//        }else {
//            editBarButtonItem.title =  "Edit"
//            flagChangeBarButtonTitle = !flagChangeBarButtonTitle
//        }
//        
//    }
    
}
