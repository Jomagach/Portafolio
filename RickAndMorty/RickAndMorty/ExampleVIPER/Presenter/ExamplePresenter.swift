//
//  ExamplePresenter.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import Foundation

// MARK: - ExamplePresenter
class ExamplePresenter {

    weak var view: ExampleView?
    var provider: ExampleProvider?
    var wireframe: ExampleWireframe?
    var currentInfo: Info? = nil
    var currentCharacters: [Character]? = nil

}

// MARK: - Extensions - Ejecuta en el presenter los llamados del View Controller
extension ExamplePresenter: ExampleEventHandler {
    func fetchData() {
        provider?.fetchData()
    }
    
    func handleNextPage(){
        guard let nextPage = currentInfo?.next else {return}
        provider?.fetchCharactersByPage(page: nextPage)
    }
    
    func handleDetails(ID: Int){
        wireframe?.showDetails(ID: ID)
    }
    
}

// MARK: - Extensions - Ejecuta en el presenter los llamados del Interactor
extension ExamplePresenter: ExampleOutput {
    func showData<T>(out: T) {
        let data: InfoAndPagination? = out as? InfoAndPagination
        self.currentInfo = data?.info
        self.currentCharacters = data?.results
        view?.showCharacter(characters: self.currentCharacters ?? [])
    }
    
    func appendData<T>(out: T) {
        let data: InfoAndPagination? = out as? InfoAndPagination
        self.currentInfo = data?.info
        self.currentCharacters = data?.results
        view?.appendData(characters: self.currentCharacters ?? [])
    }
    
    
    func manageError<T>(out: T){
        let error: Error? = out as? Error
        if let errorUnwrapped = error{
            print(errorUnwrapped.localizedDescription)
        }
    }
    
    
}
