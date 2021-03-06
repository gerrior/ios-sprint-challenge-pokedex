//
//  MainTableViewController.swift
//  Pokedex
//
//  Created by Mark Gerrior on 3/13/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    // MARK: - Properites
    var pokemonController = PokemonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // TODO: Comment out this block of code.
//        pokemonController.findPokemon(named: "1") { result in
//            if let pokemon = try? result.get() {
//                DispatchQueue.main.async {
//                    self.pokemonController.pokemon.append(pokemon)
//                    self.tableView.reloadData()
//                }
//            }
//        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonController.pokemon.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonName", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = pokemonController.pokemon[indexPath.row].name
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Search" {
            if let searchVC = segue.destination as? SearchViewController {
                searchVC.viewing = false
                searchVC.pokemonController = pokemonController
            }
        } else if segue.identifier == "View" {
            if let searchVC = segue.destination as? SearchViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                searchVC.viewing = true
                searchVC.pokemon = pokemonController.pokemon[indexPath.row]
                searchVC.pokemonController = pokemonController
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
