//
//  ViewController.swift
//  ToDo App Atheer Alzahrani
//
//  Created by Eth Os on 07/03/1443 AH.
//

import UIKit

struct Task{
    var taskTitle: String?
    var isCompleted = false
}
var taskArray = [Task]()

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, checkButtonDeleget {
    
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var taskTitle: UITextField!
    
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.imageView?.contentMode = .scaleAspectFill
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if taskArray.count > 0{
            return taskArray.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! ToDoTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        cell.cellTextField.text = taskArray[indexPath.row].taskTitle
        
        if cell.cellTextField.isEditing{
            let updated = cell.cellTextField.text
            let saveUpdate = Task(taskTitle: updated, isCompleted: false)
            taskArray.insert(saveUpdate, at: indexPath.row)
        }
        
        if taskArray[indexPath.row].isCompleted {
            cell.checkButton.setImage(UIImage(named: "tick"), for: .normal)
        }else{
            cell.checkButton.setImage(UIImage(named: "empty"), for: .normal)
        }
        return cell
    }
    
    func checkTaskTapped(at index: IndexPath) {
        if taskArray[index.row].isCompleted{
            taskArray[index.row].isCompleted = false
        }else {
            taskArray[index.row].isCompleted = true
        }
        taskTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            taskArray.remove(at: indexPath.row)
            taskTableView.deleteRows(at: [indexPath], with: .fade)
        }
        taskTableView.reloadData()
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        if taskTitle.hasText{
            let newTask = Task(taskTitle: taskTitle.text, isCompleted: false)
            taskArray.insert(newTask, at: 0)
            taskTableView.reloadData()
        }
        taskTitle.text = ""
        taskTitle.resignFirstResponder()
    }
    
}

