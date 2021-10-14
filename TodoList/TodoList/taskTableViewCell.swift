//
//  taskTableViewCell.swift
//  TodoList
//
//  Created by Kholod Sultan on 07/03/1443 AH.
//

import UIKit

protocol checkButtondelegate{
    func checkTaskTapped(at index: IndexPath)
}

class taskTableviewCell : UITableViewCell,UITextFieldDelegate {
    var delegate : checkButtondelegate!
    var indexpath : IndexPath!
    func setup() {
        self.cellfield.delegate = self
        
        
    }
 
    
    
    @IBOutlet weak var cellfield: UITextField!
    
    
    @IBOutlet weak var checkButton: UIButton!
    
    
    @IBAction func action(_ sender: Any) {
        delegate.checkTaskTapped(at: indexpath)
    }
    
    
         func textFieldShouldReturn(_ textField: UITextField) -> Bool {
             let update = Task(taskTitle: cellfield.text, isCompleted:
                              taskArray[indexpath.row].isCompleted)
                       taskArray[indexpath.row] = update
                          cellfield.resignFirstResponder()
                                   return true
    }
}

