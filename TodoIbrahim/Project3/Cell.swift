//
//  taskTableViewCell.swift
//  Project3
//


import UIKit

protocol checkButtondelegate {
    
    func checkTaskTapped(at index:IndexPath)
    
}



class Cell: UITableViewCell, UITextFieldDelegate {
    
    
    var delegate:checkButtondelegate!
    var indexpath: IndexPath!
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var cellfield: UITextField!
    
    func setup(){
        self.cellfield.delegate = self
        
    }
    
    @IBAction func action(_ sender: Any) {
        delegate.checkTaskTapped(at: indexpath)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let update = Task(taskTitle: cellfield.text)
        taskArray[indexpath.row] = update
        cellfield.resignFirstResponder()
        return true
    }
    
}





