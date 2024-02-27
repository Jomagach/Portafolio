//
//  ApiHandlerCharacter.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 26/02/24.
//

import Foundation

// MARK: ApiHandlerCharacter
final class ApiHandlerCharacter: APIHandler {
    
    func getCharacter(request: URLRequest,
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
