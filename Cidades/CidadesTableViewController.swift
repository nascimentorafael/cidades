//
//  CidadesTableViewController.swift
//  Cidades
//
//  Created by Rafael Nascimento on 02/12/15.
//  Copyright © 2015 Getinfo. All rights reserved.
//

import UIKit

class CidadesTableViewController: UITableViewController{
    
    var cidades: [Cidade] {
        var cidadesCarregadas = APICidades.carregarCidades()
        return cidadesCarregadas[0].cidades
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Modifica o icone de voltar
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icone_01@2x.png")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icone_01@2x.png")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 247/255.0, green: 184/255.0, blue: 9/255.0, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cidades.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CidadeTableViewCell

        let cidade = cidades[indexPath.row]
        
        cell.nome?.text = cidade.nome
        cell.imagem?.image = cidade.imagem

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(cidades[row].nome)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cidadeDetalheSegue" {
            if let destination = segue.destinationViewController as? DetalhesViewController {
                if let indexCidades = tableView.indexPathForSelectedRow?.row{
                    destination.cidade = cidades[indexCidades] 
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
