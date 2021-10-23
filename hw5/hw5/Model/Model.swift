//
//  Model.swift
//  hw5
//
//  Created by aprirez on 10/23/21.
//

import Foundation

struct Persons: Decodable {
    var person: [Person]
}

struct Person : Decodable {
    var name: String
    var age: String
}

