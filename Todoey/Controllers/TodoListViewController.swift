//
//  ViewController.swift
//  Todoey
//
//  Created by Donlaya on 9/8/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         print("ที่อยู่ไฟล์ที่สร้างเอง \(dataFilePath)")
        
        loadItems()
    }
    
    //REMARK: Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        }
//        else {
//            cell.accessoryType = .none
//        }
        cell.accessoryType = item.done ? .checkmark : .none //shorten
        
        return cell
    }
    
    //REMARK: Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done //shorten
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //REMARK: Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newItem1 = Item()
            newItem1.title = textField.text!
            
            self.itemArray.append(newItem1)
            
            self.saveItems()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new item"
            textField = alertTextField
            
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        
        let encorder = PropertyListEncoder()
        
        do {
            let data = try encorder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }
        catch {
            print("ใน encorder error นะ\(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decorder = PropertyListDecoder()
            do {
            itemArray = try decorder.decode([Item].self, from: data)
            }
            catch {
                print("ใน decorder error นะ\(error)")
            }
        }
    }
  
    
}







