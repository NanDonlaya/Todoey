//
//  Item.swift
//  Todoey
//
//  Created by Donlaya on 9/12/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreat: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
