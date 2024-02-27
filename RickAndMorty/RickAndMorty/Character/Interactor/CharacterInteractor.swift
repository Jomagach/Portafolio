//
//  CharacterInteractor.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 26/02/24.
//


import Foundation

final class CharacterInteractor: CharacterProvider {
    
    
    weak var output: CharacterOutput?
    
    let parseHandler: ParseHandlerCharacter = ParseHandlerCharacter()
    let apiHandler: ApiHandlerCharacter = ApiHandlerCharacter()
    
    
    func fetchCharactersByID(id: Int){
        let url : String = APIHandler.urlStringCharacters+"/\(id)"
        guard let urlCreated : URL = URL(string: url) else {return}
        let request = URLRequest(url: urlCreated)
        apiHandler.getCharacter(request: request) { data, error in
            if self.checkError(error: error) {
                self.output?.manageError(out: error)
                return }
            let result: Character? = self.parseHandler.parseCharacter(data: data)
            self.output?.showData(out: result)
        }
    }
    
    func checkError(error: Error?)-> Bool{
        if let error = error{
            return true
        }
        return false
    }

}
