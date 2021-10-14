//
//  ViewController.swift
//  ToDo.Fatimah
//
//  Created by MacBook on 08/03/1443 AH.
//

import UIKit
struct Task {
    var taskTitle: String?
    var isCompleted = false
}


var taskArray = [Task] () //هنا سوينا اوبجكت (ارري من نوع تاسك)


class ViewController:
    UIViewController,UITableViewDelegate,UITableViewDataSource, checkButtondelegate {
   
    
    
    
    @IBOutlet weak var taskeTV: UITableView!
    @IBOutlet weak var textFTV: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskeTV.dataSource = self
        taskeTV.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if taskArray.count > 0 {
            return taskArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"taskCell", for: indexPath) as! ViewControllercCell
        
        
       //عرفنا اندكس باث حق تكست فيل تبع تيبل فيو
        cell.textFTVcell.text = taskArray[indexPath.row].taskTitle
        
        cell.delegate = self
        cell.indexpath = indexPath
        
        // راح نكتب الكود الي لمن يضغط عليها تتغير الصورة
        if taskArray[indexPath.row].isCompleted{
            cell.buttonCheck.setImage(UIImage(systemName:"checkmark.circle.fill"),for: .normal)
        }else {
         cell.buttonCheck.setImage(UIImage(systemName:"circle.fill"),for: .normal)
        }
        return cell
    }
    
    
    func checkTaskTapped(at index: IndexPath) { // اذا ضغط علي زر المهام تتغير من هنا
        if (taskArray[index.row].isCompleted) {
            taskArray[index.row].isCompleted = false
        } else {
            taskArray[index.row].isCompleted = true
        }
        taskeTV.reloadData()
    }
    // راح نكتب الكود الخاص بعملية الحذف اسمها ايديتنق ستايل
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
     if editingStyle == .delete {
            taskArray.remove(at: indexPath.row) // هنا نحذفها من الصف
            taskeTV.deleteRows(at: [indexPath], with: .fade)
        }
        taskeTV.reloadData()
    }
    
    @IBAction func buttonAddTV(_ sender: Any) {
        
        if textFTV.hasText {
            let newTask = Task(taskTitle: textFTV.text, isCompleted: false)
            taskArray.insert(newTask, at: 0)
            taskeTV.reloadData()
        }
        textFTV.text = "" //فايدتها امسح الكلام الي داخل تكست فيلد
        textFTV.resignFirstResponder()//هذا السطر راح يخفي لي الكي بورد
    }
    
    
}

