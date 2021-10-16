//
//  Data.swift
//  ToDo App Atheer Alzahrani
//
//  Created by Eth Os on 09/03/1443 AH.
//

import UIKit

struct Folder{
    var name: String
    var image: String
    var color: UIColor
    var list = [Task]()
}
struct Task{
    var taskTitle: String?
    var isCompleted = false
}

var folder = [Folder(name: "My Day", image: "sun",color: .systemYellow, list: [Task]()),
              Folder(name: "Importent", image: "star",color: .systemRed, list: [Task]()),
              Folder(name: "Planed", image: "plan",color: .systemBlue, list: [Task]()),
              Folder(name: "Ideas", image: "idea",color: .systemGray2, list: [Task]())]

