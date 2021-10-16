//
//  cell.swift
//  day 14 (2)
//
//  Created by alanood on 07/03/1443 AH.
//


import UIKit

protocol checkbuttondelegate {
    func checkTaskTapped(at indax: IndexPath)
    
}
    class cell :UITableViewCell , UITextFieldDelegate {
        
    var delegate: checkbuttondelegate!
        var indexPath: IndexPath!
        
        @IBOutlet weak var cellTextfield: UITextField!
        @IBAction func checkButton(_ sender: Any) {
        }
        override func awakeFromNib() {
            super.awakeFromNib()
            cellTextfield.delegate = self
            //initialization code
        }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
        @IBAction func btn (_ sender: Any) {
            delegate.checkTaskTapped(at: indexPath)
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            let update = Task(taskTitle: cellTextfield.text, isCompleted: taskArray[indexPath.row].isCompleted)
            textField.resignFirstResponder()
            return true
        }
    }


