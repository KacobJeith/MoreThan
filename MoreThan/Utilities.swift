//
//  Utilities.swift
//  MoreThan
//
//  Created by Jacob Keith on 5/24/17.
//  Copyright © 2017 KacobJeith. All rights reserved.
//

import UIKit
import RealmSwift

func getRandomColor() -> UIColor{
    //Generate between 0 to 1
    let red:CGFloat = CGFloat(arc4random_uniform(256))/255
    let green:CGFloat = CGFloat(arc4random_uniform(256))/255
    let blue:CGFloat = CGFloat(arc4random_uniform(256))/255
    
    return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
}

func randomIntInRange(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max)))
}

func convertDateToOrderInt(month: Int, date: Int) -> Int {
    return (month << 8) + (date)
}

func initializeMonths() {
    
    let realm = try! Realm(configuration: config)
    let May = Month()
    May.month = "May"
    May.order = 0
    May.totalDays = 31
    May.frontEmpty = 1
    
    let June = Month()
    June.month = "June"
    June.order = 1
    June.totalDays = 30
    June.frontEmpty = 4
    
    let July = Month()
    July.month = "July"
    July.order = 2
    July.totalDays = 31
    July.frontEmpty = 6
    
    let August = Month()
    August.month = "August"
    August.order = 3
    August.totalDays = 31
    August.frontEmpty = 2
    
    try! realm.write {
        realm.add(May)
        realm.add(June)
        realm.add(July)
        realm.add(August)
    }
}


