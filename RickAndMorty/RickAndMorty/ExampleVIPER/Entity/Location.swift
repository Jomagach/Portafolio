//
//  Location.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import Foundation

struct Location : Codable{
    let name : String
    let url : String
    
    init(
        name: String,
        url : String) {
            self.name = name
            self.url = url
    }
}

