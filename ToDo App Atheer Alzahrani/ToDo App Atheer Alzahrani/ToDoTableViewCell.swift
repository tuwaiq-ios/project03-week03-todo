//
//  ToDoTableViewCell.swift
//  ToDo App Atheer Alzahrani
//
//  Created by Eth Os on 07/03/1443 AH.
//

import UIKit

protocol checkButtonDeleget{
    func checkTaskTapped(at index: IndexPath)
}
class ToDoTableViewCell: UITableViewCell, UITextFieldDelegate {

    var delegate: checkButtonDeleget!
    var indexPath: IndexPath!
    
    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellTextField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btn(_ sender: Any) {
        delegate.checkTaskTapped(at: indexPath)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let update = Task(taskTitle: cellTextField.text, isCompleted: taskArray[indexPath.row].isCompleted)
        taskArray[indexPath.row] = update
        textField.resignFirstResponder()
        return true
    }
}
