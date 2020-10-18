//
//  ProdutoTableViewCell.swift
//  TableView
//
//  Created by Cátia Souza on 07/10/20.
//

import UIKit

class ProdutoTableViewCell: UITableViewCell {

    @IBOutlet weak var subTituloLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var imageProduto: UIImageView!
    
    func setup(produto: Produto?) {
        
        guard let _produto = produto else {return}
        
        self.tituloLabel.text = _produto.nome
        self.subTituloLabel.text = _produto.preco
       
        self.imageProduto.image = self.loadImage(categoria: _produto.categoria)
    }
    
    private func loadImage(categoria: Categorias)->UIImage?{
        switch categoria {
        case .lazer:
            return UIImage(named: "lazer")
        case .eletronicos:
            return UIImage(named: "eletronico")
        case .eletrodomestico:
            return UIImage(named: "eletro")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
