//
//  FolderCollectionViewController.swift
//  ToDo App Atheer Alzahrani
//
//  Created by Eth Os on 09/03/1443 AH.
//

import UIKit


class FolderCollectionViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (5 * space)) / 3.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return folder.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "folder", for: indexPath) as! FolderCollectionViewCell
        let data = folder[indexPath.row]
        
        cell.folderImage.image = UIImage(named: data.image)
        cell.folderLabel.text = data.name
        cell.backgroundColor = data.color
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let data = folder[indexPath.row]
        performSegue(withIdentifier: "toTaskList", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "toTaskList" {
            return
        }
        let toDo = segue.destination as! ToDoViewController
        toDo.folder = sender as? Folder
    }
    
}
