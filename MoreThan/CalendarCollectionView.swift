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
    var randomColors = [UIColor]()
    var images: [Int : UIImage] = [:]
    
    private let reuseIdentifier = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm(configuration: config)
        
        notificationToken = realm.addNotificationBlock { notification, realm in
            /* results available asynchronously here */
            print("RELOADING")
            self.reloadView()
        }
        loadIcons()
        
        self.months = Array(realm.objects(Month.self))
        self.itemWidth = self.view.bounds.width/7
        
        for _ in 0...60 {
            randomColors.append(getRandomColor())
        }
        
        self.title = "Calendar of Love"
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
    
    deinit{
        notificationToken?.stop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.gray]
        //self.navigationItem.title = "Calendar of Love"
        loadIcons()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // needed to clear the text in the back navigation:
        self.navigationItem.title = ""
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
        
        headerView.subviews.forEach({ $0.removeFromSuperview() })
        
        headerView.addSubview(addMonthToHeader(text: months[indexPath.section].month))
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return months[section].frontEmpty + months[section].totalDays
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.subviews.forEach({ $0.removeFromSuperview() })
        
        if indexPath.row >= months[indexPath.section].frontEmpty {
            
            cell.backgroundColor = randomColors[randomIntInRange(max: randomColors.count)]
            let thisImage = images[convertDateToOrderInt(month: indexPath.section, date: indexPath.row)]
            if thisImage != nil {
                print("Adding subview for image at \(indexPath.row)")
                cell.addSubview(addCalendarImage(frame: cell.bounds,
                                                 image: thisImage!))
                cell.addSubview(addCalendarFill(color: UIColor.black, opacity: 0.05))
            } else {
                
                cell.addSubview(addCalendarFill(color: UIColor.white, opacity: 0.5))
            }
            
            cell.addSubview(addCalendarDate(text: String(indexPath.row - months[indexPath.section].frontEmpty + 1)))
            
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(months[indexPath.section].month), \(indexPath.row - months[indexPath.section].frontEmpty + 1)!")
        
        
        let realm = try! Realm(configuration: config)
        let allLocked = realm.objects(Message.self).filter("unlocked == %@", false)
        
        if allLocked.count != 0 {
            
            let randomLocked = allLocked[randomIntInRange(max: allLocked.count)]
            
            try! realm.write {
                randomLocked.month = months[indexPath.section].month
                randomLocked.date = indexPath.row - months[indexPath.section].frontEmpty + 1
                randomLocked.section = indexPath.section
                randomLocked.row = indexPath.row
                randomLocked.ordering = convertDateToOrderInt(month: indexPath.section, date: indexPath.row)
                randomLocked.unlocked = true
            }
            
        }
        
        
        let allUnlocked = realm.objects(Message.self).filter("unlocked == %@", true).sorted(byKeyPath: "ordering", ascending: true)
        
        let messageView = MessageView()
        messageView.unlockedMessages = Array(allUnlocked)
        messageView.index = allUnlocked.count - 1
        
        navigationController?.pushViewController(messageView, animated: true)

    }
    
}

extension CalendarCollectionView {
    func loadIcons() {
        let realm = try! Realm(configuration: config)
        
        let allUnlocked = realm.objects(Message.self).filter("unlocked == true")
        images = [:]
        for each in allUnlocked {
            images[each.ordering] = UIImage(named: each.image)
        }
    }
    
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
    
    func addCalendarFill(color: UIColor = UIColor.white, opacity: CGFloat = 1.0) -> UIView {
        let background = UIView()
        background.backgroundColor = color.withAlphaComponent(opacity)
        background.frame = CGRect(x: 0,
                                  y: 0,
                                  width: itemWidth,
                                  height: itemWidth)
        
        return background
    }
    
    func addCalendarImage(frame: CGRect, image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame = frame
        imageView.image = cropCenterBox(image: image)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    func cropCenterBox(image: UIImage) -> UIImage {
        let imWidth = image.size.width
        let imHeight = image.size.height
        
        let aspectRatio = imWidth / imHeight
        var cropRect = CGRect()
        
        if aspectRatio < 1 {
            
            cropRect = CGRect(x: 0,
                              y:  ((imHeight / aspectRatio) / 2) - (imWidth / 2),
                              width: imWidth,
                              height: imHeight / aspectRatio)
        } else {
            
            cropRect = CGRect(x: ((imWidth * aspectRatio) / 2) - (imHeight / 2),
                              y: 0,
                              width: imWidth * aspectRatio,
                              height: imHeight)
        }
        
        let imageRef:CGImage = image.cgImage!.cropping(to: cropRect)!
        let cropped:UIImage = UIImage(cgImage:imageRef)
        
        return cropped
        
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
