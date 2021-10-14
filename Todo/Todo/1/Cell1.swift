//
//  cell.swift
//  Todo
//
//  Created by Fawaz on 07/03/1443 AH.
//

import UIKit

protocol checkDelegate{
  func checkTapped(at index: IndexPath)
}
class Cell1: UITableViewCell, UITextFieldDelegate {
  
  var indexpth: IndexPath!
  @IBOutlet weak var TF: UITextField!
  
  @IBOutlet weak var checkfalse: UIButton!
  
  @IBAction func check(_ sender: UIButton) {
    data[indexpth.row].check = !data[indexpth.row].check
    print(data[indexpth.row].check)
    
    if data[indexpth.row].check {
      checkfalse.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
    } else{
      checkfalse.setImage(UIImage(systemName: "circle.dashed"), for: .normal)
    }
  }
  
  func textFieldShouldReturn( _ textField: UITextField)-> Bool {
    data[indexpth.row].note = TF.text ?? ""
    
    TF.resignFirstResponder()
    
    return true
  }
  
  func setup()  {
    TF.delegate = self

  }
  
}
