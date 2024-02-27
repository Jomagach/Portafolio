//
//  ExampleInteractor.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//


import Foundation

// MARK: ExampleInteractor
final class ExampleInteractor: ExampleProvider {
    
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
        guard let urlCreated : URL = URL(string: APIHandler.urlStringCharacters) else {return}
        let request = URLRequest(url: urlCreated)
        apiHandler.getCharacters(request: request) { data, error  in
            if self.checkError(error: error) {
                self.output?.manageError(out: error)
                return }
            let result: InfoAndPagination? = self.parseHandler.parseCharacters(data: data)
            self.output?.showData(out: result)
        }
    }
    
    func fetchCharactersByPage(page: String){
        guard let urlCreated : URL = URL(string: page) else {return}
        let request = URLRequest(url: urlCreated)
        apiHandler.getCharacters(request: request) { data, error in
            if self.checkError(error: error) { 
                self.output?.manageError(out: error)
                return }
            let result: InfoAndPagination? = self.parseHandler.parseCharacters(data: data)
            self.output?.appendData(out: result)
        }
    }
    
    func checkError(error: Error?)-> Bool{
        if let error = error{
            return true
        }
        return false
    }
    
    
}
