//
//  ViewController3.swift
//  sarasaud.project3
//
//  Created by SARA SAUD on 3/10/1443 AH.
//
//
//  ViewController.swift
//  project3Sara
//
//  Created by SARA SAUD on 3/7/1443 AH.
//

import UIKit

class ViewController3: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    

    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    var items = [String]()
    // array <opject>
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        title = "To Do List"
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }

    @objc private func didTapAdd(){
    
        
        
         let alert = UIAlertController(title: "New Item", message: "Enter new to do list item! ", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Enter item ......"
            
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {  [weak self](_)in
            if let field = alert.textFields?.first {
            if let text = field.text, !text.isEmpty {
                    DispatchQueue.main.async{
          
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey:"items")
                    self?.items.append(text)
                    self?.table.reloadData()
                    }
                }
            }
      }))
        present(alert, animated: true)
    }
    
    
    //Delete Swip
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deletAction = UIContextualAction(style: .destructive, title: "DELETE",handler: {
            (ac:UIContextualAction,view:UIView,success:(Bool)->Void)in
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            success(true)
        } )
        return UISwipeActionsConfiguration(actions: [deletAction])
            //
        }
    

    
   
        // Do any additional setup after loading the view.
       override func viewDidLayoutSubviews(){
            super.viewDidLayoutSubviews()
            table.frame = view.bounds
        }
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
}



