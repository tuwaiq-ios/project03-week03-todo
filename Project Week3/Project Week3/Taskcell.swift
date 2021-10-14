//
//  Taskcell.swift
//  Project Week3
//
//  Created by Sara M on 07/03/1443 AH.
//


import UIKit
protocol checkButtonDelegate {
    func checkTapped(at indx: IndexPath)
}

class Taskcell: UITableViewCell, UITextFieldDelegate {

  
    @IBOutlet weak var label1: UITextField!
    var indexpath: IndexPath!
    var taskTitle: checkButtonDelegate!
   
    @IBOutlet weak var imagecheck: UIImageView!
    
    var isChecked = false
    override func awakeFromNib() {
        super.awakeFromNib()
        label1.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            let update = Task(taskTitle: label1.text, isChecked: taskArray[indexpath.row].isChecked)
            
            taskArray[indexpath.row] = update
        label1.resignFirstResponder()
            return true
        }
    }



