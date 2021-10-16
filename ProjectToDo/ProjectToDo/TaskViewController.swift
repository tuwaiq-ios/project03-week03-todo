//
//  TaskViewController.swift
//  ProjectToDo
//
//  Created by HANAN on 11/03/1443 AH.
//

    import UIKit

    class TaskViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{


        @IBOutlet var tableView:UITableView!

        var updateDelete:(() -> Void)?
        var list:List?
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            tableView.delegate = self
            tableView.dataSource = self
            
            
            self.title=list?.name
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(showAlert))

        }
        
        @IBAction func addTask(text: String,deadline:String){
            
            list?.tasks.append(Task(title: text, deadline: deadline,done: false))
            tableView.reloadData()
        }
        
        @objc func showAlert(){
            
            let alert = UIAlertController(title: "New Task", message: "Input task title here", preferredStyle: .alert )
            
            
            let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
                
                
                let textField = alert.textFields![0] as UITextField
                guard  let text = textField.text, !text.isEmpty else {
                           return
                       }
                
                
                let deadlineTextField = alert.textFields![1] as UITextField
                guard  let text = textField.text, !text.isEmpty else {
                           return
                       }
                
                
                self.addTask(text: textField.text!,deadline: deadlineTextField.text!)
            }

            alert.addTextField { (textField) in
                textField.placeholder = "Task title here!"
                textField.textColor = .blue
            }
            
            alert.addTextField { (textField) in
                textField.placeholder = "Task deadline here!"
                textField.textColor = .blue
            }
            
            alert.addAction(save)
            let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
            
            
            alert.addAction(cancel)
            
            self.present(alert, animated:true, completion: nil)
        }
     
        func deleteTask(){
            guard let count = UserDefaults().value(forKey:"count")as? Int else{
                return
            }
             let newCount = count - 1;
            print(count)
            print(newCount)
            
            UserDefaults().setValue(newCount, forKey: "count")
            UserDefaults().setValue(nil, forKey: "task_\(count)")
            
            updateDelete?()
            navigationController?.popViewController(animated: true)
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at:indexPath, animated: true)
            let vc = storyboard?.instantiateViewController(withIdentifier: "SingleTask") as! SingleTaskViewController
            
            
            vc.title=list?.tasks[indexPath.row].title
            vc.task = list?.tasks[indexPath.row]
        
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
         func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
        {
            
    //        Delete
            
            
            let deleteTaskAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
                
                
            let deleteMenu = UIAlertController(title: nil, message: "Are you sure you want to delete this task using", preferredStyle: .actionSheet)

            let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ (alertAction) in
                self.list?.tasks.remove(at: indexPath.row)
                tableView.reloadData()
            }
          
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    
                deleteMenu.addAction(deleteAction)
                deleteMenu.addAction(cancelAction)
                    
            self.present(deleteMenu, animated: true, completion: nil)
            })
            
            
    //        MarkDone Action
            
            
            let markAsDoneAction = UITableViewRowAction(style: .normal, title: "Mark As Done" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
                
                
            let markMenu = UIAlertController(title: nil, message: "Are you sure you want to mark this task as done", preferredStyle: .actionSheet)

            let markAction = UIAlertAction(title: "Confirm", style: .destructive){ (alertAction) in
                self.list?.tasks[indexPath.row].done = true
                tableView.reloadData()
            }
          
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    
                markMenu.addAction(markAction)
                markMenu.addAction(cancelAction)
                    
            self.present(markMenu, animated: true, completion: nil)
            })
         
            
            return [deleteTaskAction,markAsDoneAction]
        }
        
        
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return list?.tasks.count ?? 0
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = list?.tasks[indexPath.row].title
            return cell
        }

    }
