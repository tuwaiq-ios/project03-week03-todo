//
//  ViewController.swift
//  Project Week3
//
//  Created by Sara M on 07/03/1443 AH.
//


import UIKit


struct Task {
    var taskTitle: String?
    var isChecked = false
}
var taskArray = [Task] ()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var Taskbox: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Taskbox.delegate = self
        Taskbox.dataSource = self
        Taskbox.rowHeight = 80
    }
    
    
    
   
    @IBAction func addbox(_ sender: Any) {
   
    let Alert = UIAlertController(title: "Add Task", message: "Add a new task", preferredStyle: .alert)
        
            Alert.addTextField()
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let newTodo = Alert.textFields![0]
            taskArray.append(Task(taskTitle: newTodo.text!, isChecked: false))
            self.Taskbox.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        Alert.addAction(addAction)
        Alert.addAction(cancelAction)
        
        present(Alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletAction = UIContextualAction(style: .destructive, title: "DELET",handler: {
          (ac:UIContextualAction,view:UIView,success:(Bool)->Void)in
          taskArray.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .left)
          success(true)
        } )
        return UISwipeActionsConfiguration(actions: [deletAction])
          //
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! Taskcell
        let task = taskArray[indexPath.row]
                cell.label1.text = task.taskTitle
                cell.indexpath = indexPath
                
                return cell
            }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! Taskcell
            
            if cell.isChecked == false {
                cell.imagecheck.image = UIImage(named: "check")
                cell.isChecked = true
            }
            else {
                cell.imagecheck.image = nil
                cell.isChecked = false
    
    
                
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                  var taskArray = [Task] ()
        
        if editingStyle == .delete { taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Taskbox.reloadData()
            
        }
    }
            }
    }
}


