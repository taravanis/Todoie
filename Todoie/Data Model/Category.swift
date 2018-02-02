//
//  Category.swift
//  Todoie
//
//  Created by Theophilos Aravanis on 1/16/18.
//  Copyright © 2018 Theophilos Aravanis. All rights reserved.
//

import Foundation
import RealmSwift

// This is the table in the Realm database
class Category: Object {
 
// This is a column in the realm database
    @objc dynamic var name = ""

    // Forward relationship of Realm Category table to Item table:  A category can point to a list item object
    let items = List<Item>()
}
