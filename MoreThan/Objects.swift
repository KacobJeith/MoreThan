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

class Message: Object {
    
    dynamic var id: Int = 0
    dynamic var month: String = ""
    dynamic var date: Int = 0
    dynamic var ordering: Int = 0
    dynamic var section: Int = 0
    dynamic var row: Int = 0
    dynamic var unlocked: Bool = false
    dynamic var intro: String = ""
    dynamic var caption: String = ""
    dynamic var image: String = ""
    
    override static func primaryKey() -> String? {
        return "image"
    }
}

class AppState: Object {
    
    dynamic var contentOffsetY: CGFloat = 0
    dynamic var id: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
