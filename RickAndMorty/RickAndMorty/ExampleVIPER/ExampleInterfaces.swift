//
//  ExampleInterfaces.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import UIKit
// MARK: - Protocol - Funcines en las que el Presenter comparte datos con el View Controller
protocol ExampleView: class {
    func showCharacter(characters: [Character]?)
    func appendData(characters: [Character]?)
}
// MARK: - Protocol - Funciones en las que el View Controler al Presenter
protocol ExampleEventHandler {
    func fetchData()
    func handleNextPage()
}
// MARK: - Protocol - Funciones que comunican al Presenter con el Interactos
protocol ExampleProvider {
    func fetchData()
    func fetchCharactersByPage(page: String)
}
// MARK: - Protocol - Funciones en las que el Interactor envia datos al Presenter
protocol ExampleOutput: class {
    func showData<T>(out: T)
    func appendData<T>(out: T)
}
