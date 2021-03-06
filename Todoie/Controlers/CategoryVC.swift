//
//  CategoryVC.swift
//  Todoie
//
//  Created by Theophilos Aravanis on 1/13/18.
//  Copyright © 2018 Theophilos Aravanis. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryVC: SwipetableVC {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    var randomColor = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        loadCategories()

    }
    
    // MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let category = categories?[indexPath.row] {
            cell.textLabel?.text = category.name
            guard let categoryColor = UIColor(hexString: category.columnColor) else {fatalError()}
            cell.backgroundColor = categoryColor
            cell.textLabel?.textColor = ContrastColorOf(categoryColor, returnFlat: true)
        }
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListVC
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    // MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        randomColor = UIColor.randomFlat.hexValue()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add ", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            newCategory.columnColor = self.randomColor
            
            self.save(category: newCategory)
        }
        
        
        alert.addTextField { (field) in
            
            textField.placeholder = "Add a new category"
            textField = field
        }

        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
// MARK: - Delete Data from Swipe
    
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
    // MARK: - Data Manipulation Methods
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        }
        catch {
            print("Error saving category \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
    
}

