//
//  ViewController.swift
//  hw5
//
//  Created by aprirez on 10/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var persons: Persons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self;
        collectionView.dataSource = self;

        if let persons = FileJsonDecoder<Persons>.decode(file: "Person") {
            self.persons = persons
            collectionView.reloadData()
            debugPrint(persons)
        } else {
            debugPrint("ERROR: no data provided or data error!")
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.persons?.person.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath)
            as? PersonCell
        {
            cell.setup(person: persons?.person[indexPath.row])
            return cell
        } else {
            debugPrint("ERROR: can't get cell as type PersonCell")
        }
        return UICollectionViewCell()
    }
    
    
}

