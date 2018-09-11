//
//  Items.swift
//  Todoey
//
//  Created by Donlaya on 9/10/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import Foundation

class Item: Codable { //Encodable, Decodable ทั้งสองอยู่ใน Codable
    
    var title: String = ""
    var done: Bool = false
}
