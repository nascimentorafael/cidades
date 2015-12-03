//
//  Cidade.swift
//  Cidades
//
//  Created by Rafael Nascimento on 02/12/15.
//  Copyright © 2015 Getinfo. All rights reserved.
//

import Foundation
import UIKit

class Cidade {
    var nome: String
    var descricao: String
    var imagem: UIImage
    
    init(nome: String, descricao: String, nomeImagem:String){
        self.nome = nome
        self.descricao = descricao
        if let img = UIImage(named: nomeImagem){
            imagem = img
        } else {
            imagem = UIImage(named: "placeholder.png")!
        }
    }
    
}
