//
//  Item.swift
//  Todoie
//
//  Created by Theophilos Aravanis on 1/16/18.
//  Copyright © 2018 Theophilos Aravanis. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated: Date?
    
// The reverse relationship of an item to its parent category
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
