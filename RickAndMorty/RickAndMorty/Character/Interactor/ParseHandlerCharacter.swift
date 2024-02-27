//
//  ParseHandlerCharacter.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 26/02/24.
//

import Foundation

// MARK: ParseHandlerCharacter
final class ParseHandlerCharacter {
    
    public func parseCharacter(data: Data?)
        -> Character? {
            guard let dataUnwrapped = data else {return nil}
            do{
                let result : Character = try JSONDecoder().decode(Character.self, from: dataUnwrapped)
                return(result)
            }catch let error{
                print(error)
                return nil
            }
    }
    
}
