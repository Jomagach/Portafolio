//
//  ExampleWireframe.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import UIKit

class ExampleWireframe {
    private var view: ExampleViewController?
    private var presenter: ExamplePresenter?
    private var interactor: ExampleInteractor?
    private var window: UIWindow?
    private var navigation: UINavigationController?

    init(in window: UIWindow?) {
        self.view = ExampleViewController()
        self.presenter = ExamplePresenter()
        self.interactor = ExampleInteractor()
        
        self.view?.eventHandler = self.presenter
        self.interactor?.output = self.presenter
        self.presenter?.view = self.view
        self.presenter?.provider = self.interactor
        self.presenter?.wireframe = self
        self.window = window
    }
    
    private func clearViper() {
        self.view?.eventHandler = nil
        self.interactor?.output = nil
        self.presenter?.view = nil
        self.presenter?.provider = nil
        self.presenter?.wireframe = nil
    }
    
    func showExampleView() {
        self.window?.rootViewController = UINavigationController(rootViewController: self.view!)
        self.window?.makeKeyAndVisible()
    }
    
}

