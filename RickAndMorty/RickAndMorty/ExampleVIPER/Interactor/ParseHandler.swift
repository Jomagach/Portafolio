//
//  ParseHandler.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 23/02/24.
//

import Foundation

// MARK: ParseHandler
final class ParseHandler {
    public func parseCharacters(data: Data?) 
        -> InfoAndPagination? {
            guard let dataUnwrapped = data else {return nil}
            do{
                let result : InfoAndPagination = try JSONDecoder().decode(InfoAndPagination.self, from: dataUnwrapped)
                return(result)
            }catch let error{
                print(error)
                return nil
            }
    }
}
