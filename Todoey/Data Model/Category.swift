//
//  Category.swift
//  Todoey
//
//  Created by Donlaya on 9/12/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
