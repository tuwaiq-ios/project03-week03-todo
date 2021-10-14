//
//  TodoCell.swift
//  TodoTutorial
//
//  Created by m al-qahtani on 10/14/21.

//

import UIKit
protocol checkButtonDeleget {
    func checkTaskTapped(at index:IndexPath)
}
class TodoCellTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    
    @IBOutlet weak var task: UITextField!
    
    @IBOutlet weak var checkmarkImage: UIImageView!
    
    var isChecked = false
    var indexpath: IndexPath!
    func setup() {
        self.task.delegate = self
        
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Initialization code
    }
    func textFieldShouldReturn( textField: UITextField)->Bool {
        
        let uppdate = Task(taskTitel: task.text, isCompleted: taskArray[indexpath.row].isCompleted)
        taskArray[indexpath.row] = uppdate
        task.resignFirstResponder()
        return true
        
        func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            
            
           
        }
        
    }
}
