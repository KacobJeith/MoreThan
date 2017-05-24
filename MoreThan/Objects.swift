//
//  Objects.swift
//  MoreThan
//
//  Created by Jacob Keith on 5/24/17.
//  Copyright © 2017 KacobJeith. All rights reserved.
//

import Foundation
import RealmSwift

class Month: Object {
    
    dynamic var month: String = "May"
    dynamic var order: Int = 0
    dynamic var frontEmpty: Int = 0
    dynamic var totalDays: Int = 30
    
    override static func primaryKey() -> String? {
        return "order"
    }
    
}

class Date: Object {
    
    dynamic var id: Int = 0
    dynamic var message: String = ""
    dynamic var image: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
