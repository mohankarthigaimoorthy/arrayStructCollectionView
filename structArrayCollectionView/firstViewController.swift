//
//  firstViewController.swift
//  structArrayCollectionView
//
//  Created by Mohan K on 17/02/23.
//

import UIKit
class myListCollection: UICollectionViewCell {
    @IBOutlet weak var textLabelone: UILabel!
}


class firstViewController: UIViewController {
    struct Task : Codable {
        var  taskName: String
        var status: Int
        var priority: Int
    }
    var allTasks = [Task(taskName: "default", status: 1, priority: 1)]
    @IBOutlet weak var collectionlist: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionlist.delegate = self
        collectionlist.dataSource = self
        // Do any additional setup after loading the view.
    
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data
        {
            allTasks = try!
            PropertyListDecoder().decode(Array<Task>.self
                                         , from: myData)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data
        {
            allTasks = try!
            PropertyListDecoder().decode(Array<Task>.self, from: myData)
        }
        self.collectionlist.reloadData()
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

extension firstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionlist.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myListCollection
        cell.textLabelone.text = allTasks[indexPath.item].taskName
//        cell.accessibilityElementsCount()
        return cell
    }
    
    
}
