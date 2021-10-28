//
//  ViewController.swift
//  to do app
//
//  Created by alanood on 21/03/1443 AH.
//

import UIKit

struct Task {
    var taskTitle : String?
    var isCompleted = false
}
class todaylist: UIViewController{
    
    var taskArray =  [Task]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var taskTitle: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        if taskTitle.hasText {
            let newTask = Task(taskTitle: taskTitle.text)
            taskArray.insert(newTask, at: 0)
            self.tableView.reloadData()
        }
        
        taskTitle.text = ""
    }
}


extension todaylist : UITableViewDataSource, CheckButtonsDelegate{
    
    func checkTaskTapped(at index: IndexPath) {
        
        if (taskArray[index.row].isCompleted){ 
            taskArray[index.row].isCompleted = false
        } else {
            taskArray[index.row].isCompleted = true
        }
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        if taskArray.count > 0 {
            return taskArray.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        
        cell.cellLabel.text = taskArray[indexPath.row].taskTitle
        if (taskArray[indexPath.row].isCompleted){
            cell.checkButton.setImage(#imageLiteral(resourceName: "checkedButton"), for: .normal)
        } else {
            cell.checkButton.setImage(#imageLiteral(resourceName: "uncheckedButton"), for: .normal)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            
        }
    }
    
    
}







