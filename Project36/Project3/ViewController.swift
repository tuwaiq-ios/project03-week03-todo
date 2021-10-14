//
//  ViewController.swift
//  Project3
//
//  Created by Pc on 07/03/1443 AH.
//


import UIKit

struct Task {
    
    var taskTitle:String?
    var isCompleted = false
}
var taskArray = [Task] ()

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, checkButtondelegate {
    
    
    
    
    
    
    @IBOutlet weak var taskTitle: UITextField!
    
    
    @IBOutlet weak var tabelView: UITableView!
    
    
    @IBOutlet weak var buttenPress: UIButton!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if taskArray.count > 0{
            return taskArray.count
        }else {
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! taskTabelViewcell
        
        cell.delegate = self
        cell.indexpath = indexPath
        cell.cellfield.text = taskArray[indexPath.row].taskTitle
        cell.setup()
        
        if taskArray[indexPath.row].isCompleted{
            
            cell.checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        } else {
            cell.checkButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        }
        return cell
    }
    
    func checkTaskTapped(at index: IndexPath) {
        if taskArray[index.row].isCompleted{
            taskArray[index.row].isCompleted = false
        }else{
            taskArray[index.row].isCompleted = true
        }
        tabelView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
    }
    
    @IBAction func action(_ sender: Any) {
        
        if taskTitle.hasText{
            let newTask = Task(taskTitle: taskTitle.text, isCompleted: false)
            
            taskArray.insert(newTask, at: 0)
            tabelView.reloadData()
            
            taskTitle.text = ""
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self
        tabelView.delegate = self
        
        
    }
    
    
}


