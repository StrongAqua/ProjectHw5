//
//  FileJsonDecoder.swift
//  hw5
//
//  Created by aprirez on 10/23/21.
//

import Foundation

class FileJsonDecoder<T> where T: Decodable {
    
    let decoder: JSONDecoder = JSONDecoder()
    
    static func decode(file: String, from: Bundle = Bundle.main) -> T? {
        let fileDecoder = FileJsonDecoder<T>()
        
        if let path = from.path(forResource: file, ofType: "json") {
            debugPrint("Found file at path: \(path)")
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                debugPrint("Data is loaded: \(data)")
                
                let result = try fileDecoder.decoder.decode(T.self, from: data)
                return result
            } catch let error {
                debugPrint(error)
            }
        } else {
            debugPrint("Can't find JSON file")
        }
        return nil
    }
    
}
