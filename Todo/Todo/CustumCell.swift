//
//  CustumCell.swift
//  Todo
//
//  Created by Macbook on 07/03/1443 AH.
//

import UIKit



class CustumCell : UITableViewCell , UITextFieldDelegate {
    
    var indexpath : IndexPath!
    
    
    @IBOutlet weak var textf: UITextField!
    
    @IBOutlet weak var checkmarkImage: UIImageView!
    
    var isChecked = false
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let new = Todo(name: textf.text)
        listdo[indexpath.row] = new
        textf.resignFirstResponder()
        
        return true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textf.delegate = self
        // Initialization code
    }
    
}
