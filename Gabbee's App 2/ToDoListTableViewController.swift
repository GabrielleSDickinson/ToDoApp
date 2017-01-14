//
//  ToDoListTableViewController.swift
//  Gabbee's App 2
//
//  Created by Gabrielle Dickinson on 12/13/16.
//  Copyright © 2016 Gabrielle Dickinson. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController {

    var toDoItems = [ToDoItem]()
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
    
        let source: ViewController = segue.source as! ViewController
        
        if let item: ToDoItem = source.toDoItem {
            
            self.toDoItems.append(item)
            
            storeToDoItem(name: item.itemName, notes: item.itemNotes)
            
            loadInitalData()
            
            self.tableView.reloadData()
        
        }
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitalData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoItemTableViewCell

        let toDoItem: ToDoItem = self.toDoItems[indexPath.row]
        
        cell.itemNameLabel?.text = toDoItem.itemName
        cell.itemNotesLabel?.text = toDoItem.itemNotes
        
        if toDoItem.completed {
            
            cell.accessoryType = .checkmark
        }
        else{
            
            cell.accessoryType = .none
        }
        
        return cell
        
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let tappedItem: ToDoItem = self.toDoItems[indexPath.row]
        
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadData()
    }
    

    
    

    func loadInitalData(){
        let moc = DataController().managedObjectContext
        
        let fetchRequest: NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        
        do {
            let searchResults = try moc.fetch(fetchRequest)
            
            print("results: \(searchResults.count)")
            
            self.toDoItems = [ToDoItem]()
            
            for entity in searchResults as [NSManagedObject] {
            
                let item = ToDoItem(
                                name: entity.value(forKey: "itemName")as! String,
                                notes: entity.value(forKey: "itemNotes")as! String
                            )
                
                self.toDoItems.append(item)
            }
            
            
        } catch {
            print("error retrieving items")
        }
        
    }
    
    
    
    func storeToDoItem(name: String, notes: String) {
        let moc = DataController().managedObjectContext
        
        let entity = NSEntityDescription.entity(forEntityName:"ToDoItemEntity", in: moc)
        
        let toDo = NSManagedObject(entity: entity!, insertInto: moc)
        
        toDo.setValue(name, forKey: "itemName")
        toDo.setValue(notes, forKey: "itemNotes")
        toDo.setValue(false, forKey: "completed")
        
        
        do {
            try moc.save()
            print("saved")
        } catch let error as NSError {
            print(error)
        } catch {
            
        }
        
    }
    
    
    
}
