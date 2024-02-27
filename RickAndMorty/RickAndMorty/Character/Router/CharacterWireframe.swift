//
//  CharacterWireframe.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 26/02/24.
//

import UIKit

class CharacterWireframe {
    private var view: CharacterViewController?
    private var presenter: CharacterPresenter?
    private var interactor: CharacterInteractor?
    private var window: UIWindow?
    private var navigation: UINavigationController?

    init(in window: UIWindow?, ID: Int) {
        self.view = CharacterViewController()
        self.presenter = CharacterPresenter()
        self.interactor = CharacterInteractor()
        
        self.view?.eventHandler = self.presenter
        self.interactor?.output = self.presenter
        self.presenter?.view = self.view
        self.presenter?.provider = self.interactor
        self.presenter?.wireframe = self
        self.presenter?.ID = ID
        self.window = window
        self.navigation = self.window!.rootViewController as? UINavigationController
    }
    
    private func clearViper() {
        self.view?.eventHandler = nil
        self.interactor?.output = nil
        self.presenter?.view = nil
        self.presenter?.provider = nil
        self.presenter?.wireframe = nil
    }
}

extension CharacterWireframe {
     func pushCharacterView(animated: Bool) {
         navigation?.pushViewController(view!, animated: animated)
     }
     
     func popCharacter(animated: Bool) {
         clearViper()
         navigation?.popViewController(animated: animated)
     }
}

