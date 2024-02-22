//
//  InfoAndPagination.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import Foundation

struct InfoAndPagination : Codable{
    let info : Info
    var results : [Character]?
    
    init(
        info: Info,
        results: [Character]?){
        self.info = info
        self.results = results
    }
}
