//
//  Category.swift
//  Todoie
//
//  Created by Theophilos Aravanis on 1/16/18.
//  Copyright © 2018 Theophilos Aravanis. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name = ""

    // Forward relationship of Category to Item:  A category can point to a list item object
    let items = List<Item>()
}
