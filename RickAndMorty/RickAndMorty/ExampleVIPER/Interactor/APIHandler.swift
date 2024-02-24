//
//  APIHandler.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 23/02/24.
//

import Foundation

// MARK: APIHandler
final class APIHandler {
    func getCharacter(request: URLRequest, 
                      completion: @escaping (_ data: Data?)->Void){
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
                    completion(data)
                }
            }
        }.resume()
    }
}
