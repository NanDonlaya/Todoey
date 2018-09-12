//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Donlaya on 9/12/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategory()
    }

    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray[indexPath.row].name
        
        return cell
    }
    
    //MARK: - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: - Add New Category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newcategory = Category(context: self.context)
            
            newcategory.name = textField.text!
            
            self.categoryArray.append(newcategory)
            
            self.saveCategory()
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            textField.placeholder = "Create your Category"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Manupulation Methods
    func saveCategory() {
        
        do {
            try context.save()
        }
        catch {
            print("Save Context Error \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategory() {
        
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
          categoryArray = try context.fetch(request)
        }
        catch {
            print("LoadCategory Error \(error)")
        }
        
        tableView.reloadData()
    }
    
}


