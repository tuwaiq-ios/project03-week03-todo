//
//  ViewController.swift
//  day 14 (2)
//
//  Created by alanood on 07/03/1443 AH.
//

import UIKit
struct Task {
    var taskTitle: String?
    var isCompleted = false
}
   class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, checkbuttondelegate {
    
       
       var taskArray = [Task]()
       
    @IBOutlet weak var tasktitle: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if taskArray.count > 0 {
                return taskArray.count
        }else {
            return 0
        }
    }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath) as! cell
                cell.delegate = self
                cell.indexPath = indexPath
                cell.cellTextfield.text = taskArray[indexPath.row].taskTitle
                cell.setup()
                
                if { (taskArray[indexPath.row].taskTitle,
                
                    cell.btn.setImage(UIImage(systemName:"checkmark.circle.fill"),for: .normal)
               }else {
                    cell.btn1.setImage(UIImage(systemName: "plus.app.fill"),for: .normal)
                        
                    }
                  return cell
        
       }
       func checkTaskTapped(at indax: IndexPath) {
        if taskArray[indax.row].isCompleted {
            taskArray[indax.row].isCompleted = false
        }else {
            taskArray[indax.row].isCompleted = true
        }
        tableView.reloadData()
    }
       func tableView( tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt: indexPath,:IndexPath ) {
          
           if editingStyle == .delete {
               taskArray.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .fade)
           }
           tableView.reloadData()
       }
        
    @IBAction func buttonpressed(_ sender: Any) {
        
        if taskTitle.hasText {
          let newTask = Task(taskTitle: taskTitle.text , isCompleted:false)
           
            taskArray.insert(newTask, at: 0)
            tableView.reloadData()
            
            tasktitle.text = ""
        }
    }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           tableView.dataSource = self
           tableView.delegate = self
       }
   }

