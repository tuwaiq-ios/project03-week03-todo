//
//  ViewControllercCell.swift
//  ToDo.Fatimah
//
//  Created by MacBook on 08/03/1443 AH.
//

import UIKit
protocol checkButtondelegate{
    func checkTaskTapped(at index: IndexPath)
}



class ViewControllercCell: UITableViewCell ,UITextFieldDelegate {
    var delegate: checkButtondelegate!
    var indexpath: IndexPath!
    
    func setup() {
        self.textFTVcell.delegate = self
    }

    @IBOutlet weak var textFTVcell: UITextField!
    
    @IBOutlet weak var buttonCheck: UIButton!

    
    @IBAction func buttonAction(_ sender: Any) {
        delegate.checkTaskTapped(at: indexpath)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let update = Task(taskTitle: textFTVcell.text, isCompleted: taskArray[indexpath.row].isCompleted)
        taskArray[indexpath.row] = update
        
        textFTVcell.resignFirstResponder()
        return true
    }
    }

    

