//
//  taskTableViewCell.swift
//  ToDo-App-week3-Afnan
//
//  Created by Fno Khalid on 07/03/1443 AH.
//

import UIKit

protocol checkButtondelgate{
    
    func checkTaskTapped(at indexpath: IndexPath )
}
  class taskTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var delgate: checkButtondelgate!
    var indexpath: IndexPath!


      @IBOutlet weak var textfield: UITextField!
      
    @IBOutlet weak var buttoncell: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textfield.delegate = self
        // Initialization code
    }

    @IBAction func buttocell1(_ sender: Any) {
        
        delgate.checkTaskTapped(at: indexpath)
            
    }
    
      var taskArray = [task]()
      
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          let update = task(taskTitle: textfield.text, iscomplatid: taskArray[indexpath.row].iscomplatid)
               taskArray[indexpath.row] = update
                textField.resignFirstResponder()
                  return true
          
      }
  }
      
