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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return months[section].frontEmpty + months[section].totalDays
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        
        if indexPath.row >= months[indexPath.section].frontEmpty {
            cell.addSubview(addCalendarFill())
            cell.addSubview(addCalendarFill(color: UIColor.gray, opacity: 0.2))
        } else {
            cell.addSubview(addCalendarFill(color: UIColor.white, opacity: 1.0))
        }
        
        
        cell.addSubview(addCalendarDate(text: String(indexPath.row - months[indexPath.section].frontEmpty + 1)))
        
        return cell
    }
    
}

extension CalendarCollectionView {
    
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
        
        return date
    }
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
