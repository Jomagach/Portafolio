//
//  CharacterPresenter.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 26/02/24.
//

import Foundation

class CharacterPresenter {

    weak var view: CharacterView?
    var provider: CharacterProvider?
    var wireframe: CharacterWireframe?
    
    var ID: Int = 0

}

// MARK: - Extensions - Ejecuta en el presenter los llamados del View Controller
extension CharacterPresenter: CharacterEventHandler {
    func fetchData() {
        provider?.fetchCharactersByID(id: ID)
    }
    
    
}

// MARK: - Extensions - Ejecuta en el presenter los llamados del Interactor
extension CharacterPresenter: CharacterOutput {
    func showData<T>(out: T) {
        let data: Character? = out as? Character
        if let character = data{
            view?.showCharacter(image: character.image, name: character.name, statusSpecie: "\(character.status) - \(character.species)", location: character.location.name, episodes: character.episode)
        }
    }
    
    func manageError<T>(out: T) {
        let error: Error? = out as? Error
        if let errorUnwrapped = error{
            print(errorUnwrapped.localizedDescription)
        }
    }
    
    
}
