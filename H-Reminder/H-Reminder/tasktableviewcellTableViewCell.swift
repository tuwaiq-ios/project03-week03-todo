//
//  tasktableviewcellTableViewCell.swift
//  H-Reminder
//
//  Created by  HANAN ASIRI on 07/03/1443 AH.
//

import UIKit

protocol checkButtondelegate {
    func checkTaskTapped(at index: IndexPath)
}

class tasktableviewcellTableViewCell: UITableViewCell {
    
    var delegate: checkButtondelegate!
    var indexPath:  IndexPath!
    
    
    @IBOutlet var cellLable: UILabel!
    
    
    @IBOutlet var checkButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn(_ sender: Any) {
        delegate.checkTaskTapped(at: indexPath)
    }
    
}
