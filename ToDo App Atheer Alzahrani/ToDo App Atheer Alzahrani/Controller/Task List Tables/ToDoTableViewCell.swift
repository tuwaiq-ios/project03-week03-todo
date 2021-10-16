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

    var folder: Folder!
    var delegate: checkButtonDeleget!
    var indexPath: IndexPath!
    
    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellTextField.delegate = self
        cellTextField.layer.borderWidth = 1.5
        cellTextField.layer.cornerRadius = 10.0
        cellTextField.clipsToBounds = true
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
//        let newTask = Task(taskTitle: cellTextField.text , isCompleted: folder.list[indexPath.row].isCompleted)
        folder.list[indexPath.row].taskTitle = cellTextField.text
        folder.list[indexPath.row].isCompleted = folder.list[indexPath.row].isCompleted
        textField.resignFirstResponder()
        return true
    }
}
