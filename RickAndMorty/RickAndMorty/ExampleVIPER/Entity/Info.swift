//
//  Info.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import Foundation

struct Info : Codable{
    let count : Int
    let pages : Int
    var next : String?
    var prev : String?
    
    init(
        count: Int,
        pages: Int,
        next: String?,
        prev: String?) {
            self.count = count
            self.pages = pages
            self.next = next
            self.prev = prev
    }
}
