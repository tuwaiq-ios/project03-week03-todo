//
//  vc1.swift
//  sarasaud.project3
//
//  Created by SARA SAUD on 3/10/1443 AH.
//

import UIKit
class Vc1: UIViewController {

    @IBAction func add(_ sender: UIButton) {

        // create the alert
        let alert = UIAlertController(title: "Coming Soon !", message: "", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

