//
//  Character.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import Foundation

struct Character : Codable{
    let id : Int
    let name : String
    let status : String
    let species : String
    let type : String
    let gender : String
    let origin : Location
    let location : Location
    let image : String
    let episode : [String]
    let url : String
    let created : String
    
    init(
        id: Int,
        name: String,
        status: String,
        species: String,
        type : String,
        gender : String,
        origin : Location,
        location : Location,
        image : String,
        episode : [String],
        url : String,
        created : String
        ) {
            self.id = id
            self.name = name
            self.status = status
            self.species = species
            self.type = type
            self.gender = gender
            self.origin = origin
            self.location = location
            self.image = image
            self.episode = episode
            self.url = url
            self.created = created
    }
}
