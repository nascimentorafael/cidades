//
//  DetalhesViewController.swift
//  Cidades
//
//  Created by Rafael Nascimento on 02/12/15.
//  Copyright © 2015 Getinfo. All rights reserved.
//
import UIKit

class DetalhesViewController: UIViewController {
    
    var cidade: Cidade?
    
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var imagem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Modifica a imagem da view para a imagem da cidade
        imagem.image = cidade?.imagem
        
        // Modifica o tituli da view para o nome da cidade
        self.title = cidade?.nome
        
        // Modifica o texto e as configurações do text view
        descricao.text = cidade?.descricao
        descricao.textColor = UIColor.darkGrayColor()
        descricao.textAlignment = .Justified
        
        if #available(iOS 8.2, *) {
            descricao.font = UIFont.systemFontOfSize(12, weight: UIFontWeightLight)
        } else {
            descricao.font = UIFont.systemFontOfSize(12)
        }
        
        descricao.scrollRangeToVisible(NSRange(location: 0,length: 0))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}