//
//  APIHandler.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 23/02/24.
//

import Foundation

// MARK: APIHandler
class APIHandler {
    
    static let urlStringCharacters : String = "https://rickandmortyapi.com/api/character"
    static let urlStringLocations : String = "https://rickandmortyapi.com/api/location"
    static let urlStringEpisodes : String = "https://rickandmortyapi.com/api/episode"
    
    
    func getCharacters(request: URLRequest,
                      completion: @escaping (Data?, Error?) -> Void){
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                completion(nil,error)
                return
            }
            if let data = data{
                if let respString = String(data: data, encoding: String.Encoding.utf8){
                    print(respString)
                }
            }
            DispatchQueue.main.async {
                completion(data,nil)
            }
        }.resume()
    }
}
