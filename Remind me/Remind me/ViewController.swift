//
//  ViewController.swift
//  Remind me
//
//  Created by sara al zhrani on 07/03/1443 AH.
//

import UIKit
struct Task {
    
    var TaskTitle: String?
    var iScompletd = false
}

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate,
                     
chekBouttonDelegte {
   
   
     

     var taskAraay = [Task]()
     
    
    @IBOutlet weak var TaskTitle: UITextField!
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        if TaskTitle.hasText {
            let newTask = Task(TaskTitle: TaskTitle.text, iScompletd: false)
            taskAraay.insert(newTask , at: 0)
            TableVIEW.reloadData()
        }
        TaskTitle.text = " "
        TaskTitle.resignFirstResponder()
    }
    
    @IBOutlet weak var TableVIEW: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableVIEW.dataSource = self
        TableVIEW.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if taskAraay.count > 0 {

        }
        
        return 0
    }
    
    
    
    
    func tableView( tableView:UITableView, commit edititingStyle:UITableViewCell.EditingStyle , forRowAt indexPath: IndexPath){
        if edititingStyle == .delete{
            
            taskAraay.remove(at: indexPath.row)
            tableView.deleteRows(at:[indexPath], with: .fade)
        }
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "task cell", for: indexPath) as!TaskTableviewCell
        cell.delegate = self
        cell.indexpath = indexPath
        cell.textlable.text = taskAraay[indexPath.row].TaskTitle
        if taskAraay[indexPath.row].iScompletd {
            cell.chekBoutton.setImage(UIImage(systemName:"circle"), for: .normal
                                      )
        } else {
            cell.chekBoutton.setImage(UIImage(systemName:"circle.inset.filled"), for: .normal
                                      )
    }
        return cell
        
        
     
        
    
        func checkTaskTapped(at index: IndexPath) {
            if taskAraay[index.row].iScompletd{
                taskAraay[index.row].iScompletd = false
            } else {
                taskAraay[index.row].iScompletd = true
        }
            tableView.reloadData()
}
        
      
        
}
}
