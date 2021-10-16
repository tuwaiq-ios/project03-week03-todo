//
//  ViewController.swift
//  ProjectToDo
//
//  Created by HANAN on 11/03/1443 AH.
//
import UIKit

    class Task: NSObject {

        var title: String
        var deadline: String
        var done: Bool

        init
        (title:String, deadline:String,done:Bool) {
            self.title = title
            self.deadline = deadline
            self.done =  done
        }
    }
    class List: NSObject {

        var name: String
        var tasks: [Task]

        init(name:String, tasks: [Task]) {
            self.name = name
            self.tasks = tasks
        }
    }

    class ViewController: UIViewController {
        @IBOutlet var tableView:UITableView!
        var data = [List]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Delete All", style: .done, target: self, action: #selector(deleteAll))
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(tapToAdd))
            

            self.title="Tasks List"
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        @objc func deleteAll(){
            data.removeAll()
            tableView.reloadData()
            
        }
     @objc   func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
      {
          let shareAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
              
              
          let deleteMenu = UIAlertController(title: nil, message: "Are you sure you want to delete this task using", preferredStyle: .actionSheet)
                  
              
              
          let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ (alertAction) in
              self.data.remove(at: indexPath.row)
              tableView.reloadData()
          }

          
                  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                  
              deleteMenu.addAction(deleteAction)
              deleteMenu.addAction(cancelAction)
                  
          self.present(deleteMenu, animated: true, completion: nil)
          })
       
          return [shareAction]
      }

        @IBAction func tapToAdd(){

            let alert = UIAlertController(title: "New Task List", message: "Input task list title here", preferredStyle: .alert )
            
            
            let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
                
                
                let textField = alert.textFields![0] as UITextField
                guard  let text = textField.text, !text.isEmpty else {
                           return
                       }
                
                
                self.data.append(List(name: textField.text!, tasks: []))
                self.tableView.reloadData()
            }

            alert.addTextField { (textField) in
                textField.placeholder = "Task List title here!"
                textField.textColor = .blue
            }
            
            alert.addAction(save)
            
            let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
            
            alert.addAction(cancel)
            
            self.present(alert, animated:true, completion: nil)

        }

    }
      



    extension ViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at:indexPath, animated: true)
            let vc = storyboard?.instantiateViewController(withIdentifier: "task")
            as! TaskViewController
            vc.title="Task"
            vc.list = data[indexPath.row]
            vc.updateDelete = {
                DispatchQueue.main.async{

                }
            }
            navigationController?.pushViewController(vc, animated: true)
        }
      
    }

    extension ViewController:UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            
            cell.textLabel?.text = data[indexPath.row].name
            return cell
        }
    }
