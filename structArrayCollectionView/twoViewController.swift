//
//  twoViewController.swift
//  structArrayCollectionView
//
//  Created by Mohan K on 17/02/23.
//

import UIKit

class mirrorCollection: UICollectionViewCell {
    @IBOutlet weak var textLabelfirst: UILabel!
}
class twoViewController: UIViewController {
    struct Task : Codable {
        var taskName: String
        var status: Int
        var priority: Int
    }
    
    var allTasks = [Task(taskName: "default", status: 1, priority: 1)]
    @IBOutlet weak var collectionMy: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionMy.delegate = self
        collectionMy.dataSource = self
        // Do any additional setup after loading the view.
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data{
            allTasks = try!
            PropertyListDecoder().decode(Array<Task>.self, from: myData)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data
        {
            allTasks = try!
            PropertyListDecoder().decode(Array<Task>.self, from: myData)
        }
        self.collectionMy.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension twoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionMy.dequeueReusableCell(withReuseIdentifier: "cellone", for: indexPath) as! mirrorCollection
        cell.textLabelfirst.text = allTasks[indexPath.item].taskName
        return cell
    }
    
    
}
