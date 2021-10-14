//
//  ViewController.swift
//  Todo
//
//  Created by Macbook on 07/03/1443 AH.
//

import UIKit


struct Todo {
    let name : String?
}
var listdo : [Todo] = []

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    
    //@IBOutlet weak var tf: UITextField!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var tablev: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablev.dataSource=self
        tablev.delegate=self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listdo.count > 0{
            return listdo.count
        }
        else {
            return 0
        }
    }
    
  
    
    @IBAction func addb(_ sender: UIButton) {
        
        let todoAlert = UIAlertController(title: "Add field", message: "Add a new field", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let newT = todoAlert.textFields![0]
            listdo.append(Todo(name: newT.text!))
            self.tablev.reloadData()
        }
        
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        present(todoAlert, animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath
        ) as! CustumCell
        
        //let re = listdo[indexPath.row]
        cell.indexpath = indexPath
        cell.textf.text = listdo[indexPath.row].name
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell1 = tableView.cellForRow(at: indexPath) as! CustumCell
        if cell1.isChecked == false {
            cell1.checkmarkImage.image = UIImage(named: "صح")
            cell1.isChecked = true
        }
        else {
            cell1.checkmarkImage.image = nil
            cell1.isChecked = false
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            listdo.remove(at: indexPath.row)
            tablev.reloadData()
        }
    }
}

