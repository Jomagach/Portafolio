//
//  UIVIewExtension.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import UIKit

extension UIView{
    
    func addShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
}
