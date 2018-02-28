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
    
    @IBAction func editBarButtonItemTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
       
        if flagChangeBarButtonTitle {
            editBarButtonItem.title =  "Done"
            flagChangeBarButtonTitle = !flagChangeBarButtonTitle
        }else {
            editBarButtonItem.title =  "Edit"
            flagChangeBarButtonTitle = !flagChangeBarButtonTitle
        }
        
    }
    
    @IBAction func unwindToToDoTableViewController(_ seque : UIStoryboardSegue){
        guard seque.identifier == "saveUnwind" else {
            return
        }
        
        let sourceVC = seque.source as! ToDoDetailTableViewController
        
        if let toDo = sourceVC.toDo {
            if let selectIndexPath = tableView.indexPathForSelectedRow {
                toDos[selectIndexPath.row] = toDo
                
                tableView.reloadRows(at: [selectIndexPath], with: .none)
                
            }else {
                let newIndexPath = IndexPath(row: toDos.count, section: 0)
                
                toDos.append(toDo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailToDo" {
            let toDoDetailTableViewController = segue.destination as! ToDoDetailTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedToDo = toDos[indexPath.row]
            toDoDetailTableViewController.toDo = selectedToDo
            
        }
    }
    
    
    
}
