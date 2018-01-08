//
//  ViewController.swift
//  Todoie
//
//  Created by Theophilos Aravanis on 12/23/17.
//  Copyright © 2017 Theophilos Aravanis. All rights reserved.
//

import UIKit

class ToDoListVC: UITableViewController {

    let itemArray = ["Get party platter", "Need Charman", "Finish Outlander"]
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    //MARK - Tableview Delegate Methods
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
            
            
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


