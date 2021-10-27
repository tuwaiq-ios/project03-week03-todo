//
//  AppDelegate.swift
//  newpro
//
//  Created by Ahmed Assiri on 08/03/1443 AH.
//


import UIKit
struct Task {
    var taskTitel:String?
    var isCompleted = false
}


///
///
///
var taskArray = [Task] ()



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    
   
    
    @IBAction func addTodo(_ sender: Any) {
        
        let todoAlert = UIAlertController(title: "Add Todo", message: "Add a new todo", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let newTodo = todoAlert.textFields![0]
            taskArray.append(Task(taskTitel: newTodo.text, isCompleted: false))
            self.todoTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        present(todoAlert, animated: true, completion: nil)
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath) as! TodoCellTableViewCell
        
        let task = taskArray[indexPath.row]
        cell.task.text = task.taskTitel
        cell.indexpath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TodoCellTableViewCell
        
        if cell.isChecked == false {
            cell.checkmarkImage.image = UIImage(named: "check")
            cell.isChecked = true
        }
        else {
            cell.checkmarkImage.image = nil
            cell.isChecked = false
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            taskArray.remove(at: indexPath.row)
            todoTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.rowHeight = 80
    }
    
    
}



