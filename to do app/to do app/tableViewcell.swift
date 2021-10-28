//
//  tableViewcell.swift
//  to do app
//
//  Created by alanood on 21/03/1443 AH.
//

import Foundation
import UIKit
protocol CheckButtonsDelegate{
    func checkTaskTapped(at index:IndexPath)
}
class TableViewCell: UITableViewCell {
    
    var delegate:CheckButtonsDelegate!
    var indexPath:IndexPath!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    @IBAction func checkTask(_ sender: Any) {
        self.delegate.checkTaskTapped(at: indexPath)
    }
}
