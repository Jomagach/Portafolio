//
//  ExamplePresenter.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import Foundation

class ExamplePresenter {

    weak var view: ExampleView?
    var provider: ExampleProvider?
    var wireframe: ExampleWireframe?

}

// MARK: - Extensions - Ejecuta en el presenter los llamados del View Controller
extension ExamplePresenter: ExampleEventHandler {
    func fetchData() {
        provider?.fetchData()
    }
    
}

// MARK: - Extensions - Ejecuta en el presenter los llamados del Interactor
extension ExamplePresenter: ExampleOutput {
    func showData<T>(out: T) {
        let data = out as? InfoAndPagination
        let info = data?.info
        let characters = data?.results
        view?.showCharacter(characters: characters ?? [])
    }
    
    
}
