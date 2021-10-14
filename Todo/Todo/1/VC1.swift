//
//  ViewController.swift
//  Todo
//
//  Created by Fawaz on 07/03/1443 AH.
//

import UIKit

class VC1: UIViewController,  UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! Cell1

    let dataVC1 = data [indexPath.row]
    
    cell.TF.text = dataVC1.note
    
    cell.indexpth = indexPath
    cell.setup()
    
    if data[indexPath.row].check {
      cell.checkfalse.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
    } else{
      cell.checkfalse.setImage(UIImage(systemName: "circle.dashed"), for: .normal)
    }
    
    return cell
  }
  
  func tableView( _ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
    
    if editingStyle == .delete{
      data.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
      TV1.reloadData()
    }
  }
  
  @IBOutlet weak var TV1: UITableView!
  @IBOutlet weak var labelName: UILabel!

  //  @IBAction func addButton(_ sender: Any)
  
  @IBAction func editButton(_ sender: Any) {
    
    data.insert(Data(note: "", check: false), at: 0)
    TV1.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
  
  }
  
  @IBAction func doneButton(_ sender: Any) {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    TV1.delegate = self
    TV1.dataSource = self
    
  }
}
