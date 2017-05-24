//
//  GroupCollectionView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/18/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class CalendarCollectionView: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var notificationToken: NotificationToken? = nil
    
    var collectionView: UICollectionView!
    var months: [Month] = []
    var itemWidth = CGFloat()
    
    private let reuseIdentifier = "Cell"
    
    deinit{
        notificationToken?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let realm = try! Realm(configuration: config)
        self.months = Array(realm.objects(Month.self))
        self.itemWidth = self.view.bounds.width/7
        
        self.title = "Sardes Calendar"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.width/7)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        self.collectionView = UICollectionView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: self.view.frame.width,
                                                             height: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)! - itemWidth),
                                               collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let realm = try! Realm(configuration: config)
        let months = realm.objects(Month.self)
        return months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath)
        headerView.addSubview(addHeaderFill(color: UIColor.white))
        headerView.addSubview(addMonthToHeader(text: months[indexPath.section].month))
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return months[section].frontEmpty + months[section].totalDays
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        
        if indexPath.row >= months[indexPath.section].frontEmpty {
            cell.addSubview(addCalendarFill())
            cell.addSubview(addCalendarFill(color: UIColor.white, opacity: 0.5))
            cell.addSubview(addCalendarDate(text: String(indexPath.row - months[indexPath.section].frontEmpty + 1)))
            
        } else {
            cell.addSubview(addCalendarFill(color: UIColor.white, opacity: 1.0))
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(months[indexPath.section].month), \(indexPath.row - months[indexPath.section].frontEmpty + 1)!")
    }
    
}

extension CalendarCollectionView {
    
    func addMonthToHeader(text: String) -> UILabel {
        let month = UILabel()
        month.frame = CGRect(x: 0,
                            y: 0,
                            width: self.view.frame.width,
                            height: itemWidth)
        month.text = text
        month.textColor = UIColor.gray
        month.font = UIFont.boldSystemFont(ofSize: 30.0)
        month.textAlignment = .center
        month.layer.shadowColor = UIColor.lightGray.cgColor
        month.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        month.layer.shadowOpacity = 0.5
        month.layer.shadowRadius = 0.25
        
        return month
    }
    
    func addHeaderFill(color: UIColor) -> UIView {
        let background = UIView()
        background.backgroundColor = color
        background.frame = CGRect(x: 0,
                                  y: 0,
                                  width: self.view.frame.width,
                                  height: itemWidth)
        
        return background
    }
    
    func addCalendarFill(color: UIColor = getRandomColor(), opacity: CGFloat = 1.0) -> UIView {
        let background = UIView()
        background.backgroundColor = color.withAlphaComponent(opacity)
        background.frame = CGRect(x: 0,
                                  y: 0,
                                  width: itemWidth,
                                  height: itemWidth)
        
        return background
    }
    
    func addCalendarDate(text: String) -> UILabel {
        let date = UILabel()
        date.frame = CGRect(x: 0,
                            y: 0,
                            width: itemWidth,
                            height: itemWidth)
        date.text = text
        date.textColor = .white
        date.font = UIFont.boldSystemFont(ofSize: 30.0)
        date.textAlignment = .center
        date.layer.shadowColor = UIColor.lightGray.cgColor
        date.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        date.layer.shadowOpacity = 0.5
        date.layer.shadowRadius = 0.25
        
        
        return date
    }
    

    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
