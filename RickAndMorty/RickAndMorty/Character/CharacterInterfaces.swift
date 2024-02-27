//
//  CharacterInterfaces.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 26/02/24.
//

import UIKit
// MARK: - Protocol - Funcines en las que el Presenter comparte datos con el View Controller
protocol CharacterView: class {
    func showCharacter(image: String,
                       name: String,
                       statusSpecie: String,
                       location: String,
                       episodes: [String])
}
// MARK: - Protocol - Funciones en las que el View Controler al Presenter
protocol CharacterEventHandler {
    func fetchData()
}
// MARK: - Protocol - Funciones que comunican al Presenter con el Interactos
protocol CharacterProvider {
    func fetchCharactersByID(id: Int)
}
// MARK: - Protocol - Funciones en las que el Interactor envia datos al Presenter
protocol CharacterOutput: class {
    func showData<T>(out: T)
    func manageError<T>(out: T)
}
