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
        getCharacter(request: request) { data in
            self.output?.showData(out: data)
        }
    }
    
    func fetchCharactersByID(id: Int){
        let url : String = urlStringCharacters+"\(id)"
        guard let urlCreated : URL = URL(string: url) else {return}
        let request = URLRequest(url: urlCreated)
        getCharacter(request: request) { data in
            self.output?.showData(out: data)
        }
    }
    
    func fetchCharactersByPage(page: String){
        guard let urlCreated : URL = URL(string: page) else {return}
        let request = URLRequest(url: urlCreated)
        getCharacter(request: request) { data in
            self.output?.appendData(out: data)
        }
    }
    
    func getCharacter(request: URLRequest, completion: @escaping (_ data: InfoAndPagination?)->Void){
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let data = data{
                if let respString = String(data: data, encoding: String.Encoding.utf8){
                    print(respString)
                }
                DispatchQueue.main.async {
                    do{
                        let result = try JSONDecoder().decode(InfoAndPagination.self, from: data)
                        completion(result)
                    }catch let error{
                        print(error)
                    }
                }
            }
        }.resume()
    }
}
