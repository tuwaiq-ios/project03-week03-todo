//
//  ViewController.swift
//  day15-2
//
//  Created by sally asiri on 08/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var tf: UITextField!
    
    @IBOutlet weak var tf1: UITextField!
    
    @IBOutlet weak var tf3: UITextField!
    
    @IBOutlet weak var seg1: UISegmentedControl!

    @IBAction func seg2(_ sender: UISegmentedControl){
        
    switch seg1.selectedSegmentIndex{
            
            
        case 0:
          tf1.isHidden = false
           tf3.isHidden = false
            tf.isHidden = false
        case 1:
         tf1.isHidden = true
           tf3.isHidden = true
            tf.isHidden = true
        
        default:
            break;
            
        }}
         
    
    
    
     override func viewDidLoad() {        super.viewDidLoad()
        
        
        
        
     
        let savedName = UserDefaults.standard.value(
            forKey: "name_key"
        ) as? String
        tf.text = savedName
        
           let savedName1 = UserDefaults.standard.value(
               forKey: "name_key1"
           ) as? String
           tf1.text = savedName1
        
           let savedName3 = UserDefaults.standard.value(
               forKey: "name_key3"
           ) as? String
           tf3.text = savedName3
    }

    @IBAction func bouttonpressed(_ sender: Any) {
        
        var name = tf.text ?? "sally"
        if name.isEmpty {
            name = "name_key"
        }
        
        var name1 = tf1.text ?? "sally"
        if name1.isEmpty {
            name1 = "name_key1"
        }
        var name3 = tf3.text ?? "sally"
        if name3.isEmpty {
            name3 = "name_key3"
        }
        UserDefaults.standard.set(name, forKey: "name_key")
        UserDefaults.standard.set(name1, forKey: "name_key1")
        UserDefaults.standard.set(name3, forKey: "name_key3")
        
    }
    
}

