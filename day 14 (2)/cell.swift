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
        var indexPath: IndexPath
        
        func setup()  {
            self.celltextfield.delegate = self
        }


