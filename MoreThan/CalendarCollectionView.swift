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
    var lastSelected = IndexPath(item: 0, section: 0)
    var pressStartTime: TimeInterval = 0.0
    var unlockDuration: CGFloat = 1.0
    var unlockingIndexPath =  IndexPath(item: 0, section: 0)
    var unlockImage = UIImage(named: "redheart")!
    
    private let reuseIdentifier = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm(configuration: config)
        
        notificationToken = realm.addNotificationBlock { notification, realm in
            /* results available asynchronously here */
            
            
            self.collectionView.reloadItems(at: [self.lastSelected])
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
                                                             height: self.view.frame.height),
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
        
        self.collectionView.frame = CGRect(x: 0,
                                           y: 0,
                                           width: self.view.frame.width,
                                           height: self.view.frame.height)
        self.navigationItem.title = "Calendar of Love"
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
                
                let thisHeart = self.collectionView.viewWithTag(120349861234)
                
                if thisHeart != nil {
                    print("found heart")
                    thisHeart?.removeFromSuperview()
                }
                
                print("Adding subview for image at \(indexPath.row)")
                cell.addSubview(addCalendarImage(frame: cell.bounds,
                                                 image: thisImage!))
                cell.addSubview(addCalendarFill(color: UIColor.black, opacity: 0.01))
                cell.addSubview(addCalendarDate(text: String(indexPath.row - months[indexPath.section].frontEmpty + 1),
                                                opacity: 0.1))
            } else {
                
                cell.addSubview(addCalendarFill(color: UIColor.white, opacity: 0.5))
                cell.addSubview(addCalendarDate(text: String(indexPath.row - months[indexPath.section].frontEmpty + 1),
                                                opacity: 1.0))
                
                let unlock = UILongPressGestureRecognizer(target: self,
                                                          action: #selector(handleLongPress))
                
                unlock.minimumPressDuration = 0.1
                cell.tag = convertDateToOrderInt(month: indexPath.section, date: indexPath.row)
                cell.addGestureRecognizer(unlock)
            }
            
            
            
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(months[indexPath.section].month), \(indexPath.row - months[indexPath.section].frontEmpty + 1)!")
        
        
        let thisOrdering = convertDateToOrderInt(month: indexPath.section, date: indexPath.row)
        
        if images[thisOrdering] != nil {
            
            let messageView = MessageView()
            let realm = try! Realm(configuration: config)
            let allUnlocked = realm.objects(Message.self).filter("unlocked == %@", true).sorted(byKeyPath: "ordering", ascending: true)
            
            messageView.unlockedMessages = Array(allUnlocked)
            messageView.index = allUnlocked.count - 1
            var orderCounter = 0
            
            for each in allUnlocked {
                if each.ordering == thisOrdering {
                    
                    messageView.index = orderCounter
                    print("breaking")
                    break
                } else {
                    orderCounter += 1
                    print("Still searching")
                }
            }
            
            
            navigationController?.pushViewController(messageView, animated: true)
        }
        
        

    }
    
    func handleLongPress(gesture: UILongPressGestureRecognizer) {
        
        let p = gesture.location(in: self.collectionView)
        
        if let indexPath = self.collectionView.indexPathForItem(at: p) {
            unlockingIndexPath = indexPath
            
            let cell = self.collectionView.cellForItem(at: indexPath)
            //print((cell?.tag)!)
            
            if cell != nil && images[(cell?.tag)!] == nil {
                handleUnlocking(gesture: gesture)
            }
        } else {
            print("couldn't find index path")
        }
        
        
    }
    
    func handleUnlocking(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizerState.began {
            pressStartTime = NSDate.timeIntervalSinceReferenceDate
            let startFrame = CGRect(x: gesture.location(in: self.collectionView).x - 50,
                                    y: gesture.location(in: self.collectionView).y - 50,
                                    width: 100,
                                    height: 100)
            
            displayHeart(gesture: gesture, frame: startFrame)
            
        } else if gesture.state == UIGestureRecognizerState.changed {
            let duration = CGFloat(NSDate.timeIntervalSinceReferenceDate - pressStartTime)
            
            if duration > self.unlockDuration {
                print("UNLOCK")
                let thisHeart = self.collectionView.viewWithTag(120349861234)
                
                if thisHeart != nil {
                    thisHeart?.removeFromSuperview()
                }
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                unlockThisCell()
            }
            
            let newSize = 100 + 300 * duration
            let newOffset = newSize / 2
            let growFrame = CGRect(x: gesture.location(in: self.collectionView).x - newOffset,
                                   y: gesture.location(in: self.collectionView).y - newOffset,
                                   width: newSize,
                                   height: newSize)
            
            displayHeart(gesture: gesture, frame: growFrame)
            
            
        } else if gesture.state == UIGestureRecognizerState.ended {
            
            
        }
    }
    
    func unlockThisCell() {
        let indexPath = unlockingIndexPath
        
        let realm = try! Realm(configuration: config)
        let allLocked = realm.objects(Message.self).filter("unlocked == %@", false)
        let thisOrdering = convertDateToOrderInt(month: indexPath.section, date: indexPath.row)
        
        
        print(indexPath)
        lastSelected = indexPath
        let randomLocked = allLocked[randomIntInRange(max: allLocked.count)]
        
        try! realm.write {
            randomLocked.month = months[indexPath.section].month
            randomLocked.date = indexPath.row - months[indexPath.section].frontEmpty + 1
            randomLocked.section = indexPath.section
            randomLocked.row = indexPath.row
            randomLocked.ordering = thisOrdering
            randomLocked.unlocked = true
        }
    }
    
    func displayHeart(gesture: UILongPressGestureRecognizer, frame: CGRect) {
        
        let thisHeart = self.collectionView.viewWithTag(120349861234)
        
        if thisHeart != nil {
            thisHeart?.removeFromSuperview()
        }
        
        let imageView = UIImageView(frame: frame)
        imageView.accessibilityFrame = frame
        imageView.alpha = 0.5
        imageView.image = self.unlockImage
        imageView.tag = 120349861234
        
        self.collectionView.addSubview(imageView)
    }
    
    func unlockNextAndDisplay() {
        
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
        let cgimage = image.cgImage
        var cropped = image
        
        if cgimage != nil {
            let croppingto = cgimage!.cropping(to: cropRect)
            
            if croppingto != nil {
                
                cropped = UIImage(cgImage: croppingto!)
            }
        }
        
        return cropped
        
    }
    
    func addCalendarDate(text: String, opacity: CGFloat) -> UILabel {
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
