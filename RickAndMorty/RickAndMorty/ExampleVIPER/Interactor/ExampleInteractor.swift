//
//  ExampleInteractor.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//


import Foundation

// MARK: ExampleInteractor
final class ExampleInteractor: ExampleProvider {
    
    let urlStringCharacters : String = "https://rickandmortyapi.com/api/character"
    let urlStringLocations : String = "https://rickandmortyapi.com/api/location"
    let urlStringEpisodes : String = "https://rickandmortyapi.com/api/episode"
    
    weak var output: ExampleOutput?
    let parseHandler: ParseHandler = ParseHandler()
    let apiHandler: APIHandler = APIHandler()
    
    func fetchData(){
        fetchCharacters()
    }
    
    private func loadJSONData(filename: String) -> Data? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
    
    func fetchCharacters(){
        guard let urlCreated : URL = URL(string: urlStringCharacters) else {return}
        let request = URLRequest(url: urlCreated)
        apiHandler.getCharacter(request: request) { data in
            let result = self.parseHandler.parseCharacters(data: data)
            self.output?.showData(out: result)
        }
    }
    
    func fetchCharactersByID(id: Int){
        let url : String = urlStringCharacters+"\(id)"
        guard let urlCreated : URL = URL(string: url) else {return}
        let request = URLRequest(url: urlCreated)
        apiHandler.getCharacter(request: request) { data in
            let result = self.parseHandler.parseCharacters(data: data)
            self.output?.showData(out: result)
        }
    }
    
    func fetchCharactersByPage(page: String){
        guard let urlCreated : URL = URL(string: page) else {return}
        let request = URLRequest(url: urlCreated)
        apiHandler.getCharacter(request: request) { data in
            let result = self.parseHandler.parseCharacters(data: data)
            self.output?.appendData(out: result)
        }
    }
    
    
}
