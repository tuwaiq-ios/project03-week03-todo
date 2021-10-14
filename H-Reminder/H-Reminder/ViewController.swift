//
//  ViewController.swift
//  H-Reminder
//
//  Created by  HANAN ASIRI on 07/03/1443 AH.
//

import UIKit
struct Task {
    var taskTitle: String
    var isCompleted = false
}

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,checkButtondelegate {

   
    
    
    
  var taskArray = [Task]()

    @IBOutlet var taskTitle: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if taskArray.count > 0 {
            return taskArray.count
        } else {
    return 0
        }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! tasktableviewcellTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        cell.cellLable.text = taskArray [indexPath.row].taskTitle
       
        if taskArray[indexPath.row].isCompleted {
            cell.checkButton.setImage(_ImageLiteralType(named: "check"), for: .normal)
            
        } else {
            cell.checkButton.setImage(_ImageLiteralType(named: "uncheck"), for: .normal)
                                      
    }
        return cell
        
    }
        func checkTaskTapped(at index: IndexPath) {
            if taskArray[index.row].isCompleted {
                taskArray[index.row].isCompleted = false
            } else {
                taskArray[index.row].isCompleted = true
            }
            tableView.reloadData()
           }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
        }
    
    
    
    @IBAction func buttonePressed(_ sender: Any) {
        
        if taskTitle.hasText {
            let newTask = Task (taskTitle: taskTitle.text!, isCompleted: false)
            taskArray.insert (newTask , at: 0)
            tableView.reloadData()
        }
        taskTitle.text = ""
        taskTitle.resignFirstResponder()
     }
     }

