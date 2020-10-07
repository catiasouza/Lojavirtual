//
//  Produtos.swift
//  TableView
//
//  Created by Cátia Souza on 05/10/20.
//

import Foundation

enum Categorias: Int{
    
    case eletronicos = 0
    case lazer = 1
    case eletrodomestico = 2
}

struct Produto {
    let nome: String
    let preco: String
    let categoria: Categorias
}

