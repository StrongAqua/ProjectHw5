//
//  PersonCell.swift
//  hw5
//
//  Created by aprirez on 10/23/21.
//

import Foundation
import UIKit

class PersonCell: UICollectionViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    
    func setup(person: Person?) {
        guard let person = person else {return}
        labelName.text = person.name
        labelAge.text = person.age
    }
    
}
