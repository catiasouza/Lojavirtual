//
//  ProdutosVC.swift
//  TableView
//
//  Created by Cátia Souza on 05/10/20.
//

import UIKit



class ProdutosVC: UIViewController{
    
    @IBOutlet weak var produtosTableView: UITableView!
    
    var categorias: [String] = ["Eletronicos", "Lazer", "Eletrodomesticos"]
    
    var produtos: [Produto] = [
        Produto(nome: "Bicicleta", preco: "R$ 1.900,00", categoria: .lazer),
        Produto(nome: "Bola de Futebol", preco: "R$ 99,00", categoria: .lazer),
        Produto(nome: "Geladeira", preco: "R$ 8.000,00", categoria: .eletrodomestico),
        Produto(nome: "TV", preco: "R$ 6.000,00", categoria: .eletrodomestico),
        Produto(nome: "Fogao", preco: "R$ 2.000,00", categoria: .eletrodomestico),
        Produto(nome: "MacBook", preco: "R$ 10.000,00", categoria: .eletronicos)]
    
    private func configTableView(){
        
        self.produtosTableView.dataSource = self
        self.produtosTableView.delegate = self
        //esconde as linhas nao usadas da table view
        self.produtosTableView.tableFooterView = UIView(frame: .zero)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
    }
    private func numeroItensPorCategoria(section: Int) -> Int{
        
        var arrayProdutosFiltrados:[Produto ] = []
        
        for value in self.produtos{
            if value.categoria.rawValue == section{
                arrayProdutosFiltrados.append(value)
            }
            
        }

        return arrayProdutosFiltrados.count
    }
    func loadArrayFiltrado(section: Int) -> [Produto]{
        let arrayfiltrado = self.produtos.filter({$0.categoria.rawValue == section })
        return arrayfiltrado
    }
}

// MARK: - Table view data source

extension ProdutosVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numeroItensPorCategoria(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = produtosTableView.dequeueReusableCell(withIdentifier: "ProdutoCell", for: indexPath)
        
        let arrayProdutosFiltrado: [Produto] = self.loadArrayFiltrado(section: indexPath.section)
        
        //           var arrayProdutosFiltrados:[Produto] = []
        //            for value in self.produtos{
        //                if  value.categoria.rawValue == indexPath.section{
        //                    arrayProdutosFiltrados.append(value)
        //                }
        //            }
        cell.textLabel?.text = arrayProdutosFiltrado[indexPath.row].nome
        cell.detailTextLabel?.text = arrayProdutosFiltrado[indexPath.row].preco
        return cell
    }
      
  
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categorias[section]
    }
}
extension ProdutosVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
