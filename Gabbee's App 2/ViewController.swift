//
//  ViewController.swift
//  Gabbee's App 2
//
//  Created by Gabrielle Dickinson on 12/13/16.
//  Copyright © 2016 Gabrielle Dickinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoItem: ToDoItem?

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var notesField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if (sender as AnyObject) as? UIBarButtonItem != self.doneButton {
            return
        }
        if self.fieldsAreValid() {
            self.toDoItem = ToDoItem(name: self.nameField.text!, notes: self.notesField.text!)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func fieldsAreValid() -> Bool {
        if self.nameField.text!.utf16.count == 0 {
            return false
        }
        if self.notesField.text!.utf16.count == 0 {
            return false
        }
        
        return true
    }
}



