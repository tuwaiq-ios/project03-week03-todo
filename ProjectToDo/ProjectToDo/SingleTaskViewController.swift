//
//  SingleTaskViewController.swift
//  ProjectToDo
//
//  Created by HANAN on 11/03/1443 AH.
//

import UIKit

class SingleTaskViewController: UIViewController {
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var deadlineLabel:UILabel!
    @IBOutlet var doneLabel:UILabel!

    var task:Task?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = task?.title
        deadlineLabel.text = task?.deadline
        doneLabel.text = task?.done == true ? "Done" : "Not Done"
        doneLabel.textColor = task? .done == true ? .green : .red


  
    }


}

