//
//  ToDoDetialsViewController.swift
//  Gabbee's App 2
//
//  Created by Gabrielle Dickinson on 1/17/17.
//  Copyright © 2017 Gabrielle Dickinson. All rights reserved.
//

import UIKit

class ToDoDetialsViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemNotesLabel: UILabel!
   
    var toDoItem: ToDoItem?
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.itemNameLabel.text = self.toDoItem?.itemName
        self.itemNotesLabel.text = self.toDoItem?.itemNotes
        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
