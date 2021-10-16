//
//  UsersVC.swift
//  tasklist
//
//  Created by Kholod Sultan on 10/03/1443 AH.
//

import UIKit
class UsersVC :UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrNames = [String] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate  = self
        tableView.dataSource = self
    }
    
    
    
    @IBAction func btnEdit(_ sender: Any) {
        
        tableView.isEditing = !tableView.isEditing
        
        
        
        
        
    }
    @IBAction func btnAdd(_ sender: Any) {
        if let text = txtUsername.text{
            arrNames.append(text)
            let indexpath = IndexPath(row: arrNames.count-1, section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexpath], with:  .automatic)
            tableView.endUpdates()
            txtUsername.text  = ""
        
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text=arrNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrNames.swapAt(sourceIndexPath.row,destinationIndexPath.row )
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler )in
                self.arrNames.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        
        let favoriteAction = UIContextualAction(style: .normal, title: "My favorite") { (_,_,_) in
            
          print ("user added to favorite list ")
        }
        deleteAction.image = UIImage(systemName: "trash")
        favoriteAction.image = UIImage(systemName: "heart")
        favoriteAction.backgroundColor = _ColorLiteralType.purple
        
    
        
     return UISwipeActionsConfiguration (actions: [deleteAction, favoriteAction])
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    }
    
   
    
    
    
    
    
    
    
    

    


