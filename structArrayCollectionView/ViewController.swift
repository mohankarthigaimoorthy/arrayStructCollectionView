//
//  ViewController.swift
//  structArrayCollectionView
//
//  Created by Mohan K on 17/02/23.
//

import UIKit
struct Task : Codable {
    var taskName : String
    var status :  Int
    var priority: Int
}


class ViewController: UIViewController {

    var allTasks  = [Task(taskName: "default", status: 1, priority: 3)]
    
    @IBOutlet weak var textName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data{
            allTasks = try! PropertyListDecoder().decode(Array<Task>.self, from: myData)
        }
    }


    @IBAction func updateBtn(_ sender: Any) {
        let newTask = Task(taskName: textName.text!, status: 1, priority: 1)
        allTasks.append(newTask)
        UserDefaults.standard.set(try?PropertyListEncoder().encode(allTasks), forKey: "SavedTasks")
        
    }
    
    
}

