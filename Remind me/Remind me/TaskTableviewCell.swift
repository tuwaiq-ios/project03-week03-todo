//
//  TaskTableviewCell.swift
//  Remind me
//
//  Created by sara al zhrani on 07/03/1443 AH.
//

import UIKit

protocol chekBouttonDelegte {
    func checkTaskTapped(at index:IndexPath)
    
}
class TaskTableviewCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: chekBouttonDelegte!
    var indexpath: IndexPath!
    @IBOutlet weak var textlable: UITextField!
    
    @IBOutlet weak var chekBoutton: UIButton!
    
    override func
    awakeFromNib() {
        super.awakeFromNib()
        textlable.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    @IBAction func btn(_ sender: Any) {
        delegate.checkTaskTapped(at: indexpath)
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        let update = Task(TaskTitle: textlable.text, iScompletd:
//       taskAraay[indexpath.row].iScompletd)
//        taskAraay[indexpath.row] = update
//    textField.resignFirstResponder()
//    return true
//    }
//    
}
