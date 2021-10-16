//
//  ViewController.swift
//  ToDo App Atheer Alzahrani
//
//  Created by Eth Os on 07/03/1443 AH.
//

import UIKit



class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, checkButtonDeleget {
    
    var folder: Folder?
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var taskTitle: UITextField!
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var folderNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UserDefaults.standard.set(folder, forKey: "folder")
        view.backgroundColor = folder!.color
        folderNameLabel.text = folder!.name
        button.imageView?.contentMode = .scaleAspectFill
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if folder!.list.count > 0{
            return folder!.list.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! ToDoTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        cell.folder = folder!
        cell.cellTextField.text = folder!.list[indexPath.row].taskTitle
        cell.backgroundColor = .clear

        if folder!.list[indexPath.row].isCompleted {
            cell.checkButton.setImage(UIImage(named: "tick"), for: .normal)
        }else{
            cell.checkButton.setImage(UIImage(named: "empty"), for: .normal)
        }
        return cell
    }
    
    func checkTaskTapped(at index: IndexPath) {
        if folder!.list[index.row].isCompleted{
            folder!.list[index.row].isCompleted = false
        }else {
            folder!.list[index.row].isCompleted = true
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Alert ! ", message: "are you sure you want delete this task ?", preferredStyle: .alert )
            alert.addAction(UIAlertAction (title: "Cancel", style: .default, handler: { _ in
                return
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: { [self] _ in
                        //Delete Action
                folder!.list.remove(at: indexPath.row)
                self.taskTableView.deleteRows(at: [indexPath], with: .fade)
                                    }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        taskTableView.reloadData()
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        if taskTitle.hasText{
            let newTask = Task(taskTitle: taskTitle.text, isCompleted: false)
            folder!.list.insert(newTask, at: 0)
            taskTableView.reloadData()
        }
        taskTitle.text = ""
        taskTitle.resignFirstResponder()
    }
          
        
}

