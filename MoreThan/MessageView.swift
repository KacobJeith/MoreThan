//
//  GroupCollectionView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/18/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class MessageView: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var notificationToken: NotificationToken? = nil
    
    var collectionView: UICollectionView!
    var itemWidth = CGFloat()
    var randomColors = [UIColor]()
    var unlockedMessages = [Message]()
    var index = 0
    var onceOnly = false
    
    private let reuseIdentifier = "Cell"
    
    deinit{
        notificationToken?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.itemWidth = self.view.bounds.width
        
        //self.title = unlockedMessages[index].month
        let layout: UICollectionViewFlowLayout = SnappingCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = self.view.bounds.width/4
        layout.minimumLineSpacing = self.view.bounds.width/4
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemWidth,
                                 height: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)!)
        
        self.collectionView = UICollectionView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: itemWidth,
                                                             height: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)!),
                                               collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.black
        self.view.addSubview(collectionView!)
        self.collectionView.isScrollEnabled = true
        self.collectionView.decelerationRate = 1.25
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !onceOnly {
            let indexToScrollTo = IndexPath(item: index, section: 0)
            self.collectionView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
            onceOnly = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.title = "The Official Janky Calendar of Love"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return unlockedMessages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.subviews.forEach({ $0.removeFromSuperview() })
        cell.backgroundColor = UIColor.black
        cell.addSubview(addImageToView(index: indexPath.row))
        let imageOverlay = UIView(frame: cell.bounds)
        imageOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        cell.addSubview(imageOverlay)
        cell.addSubview(addIntroToView(index: indexPath.row))
        cell.addSubview(addCaptionToView(index: indexPath.row))
        /*
        let swipe = UISwipeGestureRecognizer(target: self,
                                             action: #selector(handleSwipe))
        
        */
        
        return cell
    }
    
}

extension MessageView {
    /*func handleSwipe(gesture: UISwipeGestureRecognizer) {
        self.collectionView.scrollToItemAtIndexPath(NSIndexPath,
                                                    atScrollPosition: UICollectionViewScrollPosition.Top,
                                                    animated: true)
    }*/
}

extension MessageView {
    
    func addImageToView(index: Int) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: itemWidth, height: self.view.bounds.height)
        imageView.image = UIImage(named: unlockedMessages[index].image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func addIntroToView(index: Int) -> UIView {
        let intro = UIView()
        intro.frame = CGRect(x: 0,
                             y: 0,
                             width: self.view.bounds.width,
                             height: self.view.bounds.height/8)
        
        intro.backgroundColor = UIColor.clear
        intro.addSubview(addTextToView(text: unlockedMessages[index].intro,
                                       frame: intro.frame))
        
        return intro
    }
    
    func addCaptionToView(index: Int) -> UIView {
        let caption = UIView()
        caption.frame = CGRect(x: 0,
                               y: 4 * (self.view.bounds.height/5),
                               width: self.view.bounds.width,
                               height: self.view.bounds.height/5)
        let textFrame = CGRect(x: 0,
                              y: 0,
                              width: self.view.bounds.width,
                              height: self.view.bounds.height/5)
        caption.backgroundColor = UIColor.clear
        caption.addSubview(addTextToView(text: unlockedMessages[index].caption,
                                         frame: textFrame))
        
        return caption
    }
    
    func addTextToView(text: String, frame: CGRect) -> UILabel {
        let textView = UILabel()
        textView.frame = frame
        
        textView.text = text
        textView.textColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.numberOfLines = 0
        textView.layer.shadowColor = UIColor.lightGray.cgColor
        textView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        textView.layer.shadowOpacity = 0.5
        textView.layer.shadowRadius = 0.25
        
        return textView
    }
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
