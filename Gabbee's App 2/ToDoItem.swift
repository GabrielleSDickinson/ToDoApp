//
//  ToDoItem.swift
//  Gabbee's App 2
//
//  Created by Gabrielle Dickinson on 12/13/16.
//  Copyright © 2016 Gabrielle Dickinson. All rights reserved.
//

import Foundation

class ToDoItem: NSCoder  {

    var itemName: String = ""
    var completed: Bool = false
    var creationDate = Date()
    
    init (name:String){
        self.itemName=name
    }
 }
