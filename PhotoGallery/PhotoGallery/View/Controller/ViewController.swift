//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/29/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import UIKit
import Photos


class ViewController: UICollectionViewController {

    var store:PhotoStore?
    private var segmentControl:UISegmentedControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupSegmentationController()
        getPhotoLibraryPermission()
    }
    
    private func setup(){
        navigationItem.title = "Photo Gallery"
        collectionView = PhotoGalleryCollectionView(frame: collectionView.frame)
    }
    
    func animateItemTransition() {
        collectionView.performBatchUpdates {
            if let removedItems = store?.removedIndexes {
                if segmentControl?.selectedSegmentIndex == 1 {
                    collectionView.deleteItems(at: removedItems.map({ IndexPath(item: $0, section: 0) }))
                }
                if segmentControl?.selectedSegmentIndex == 0 {
                    collectionView.insertItems(at: removedItems.map({ IndexPath(item: $0, section: 0) }))
                }
            }
        } completion: {[weak self] (done) in
            print("animateItemTransition: \(done)")
            self?.collectionView.reloadData()
        }
    }    
}

extension ViewController {  // UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store?.currentGallery.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellReuseID, for: indexPath) as! PhotoCollectionViewCell
        if let vm = store?.currentGallery[indexPath.item] {
            cell.setCellProperites(vm)
        }
        cell.backgroundColor = .red
        return cell
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ViewController { // UISegmentedControl
    
    private func setupSegmentationController(){
        let titles = ["All","Favorites"]
        segmentControl = UISegmentedControl(items: titles )
        //segmentControl?.tintColor = .systemBackground
        segmentControl?.backgroundColor = .systemYellow
        for i in 0..<titles.count {
            segmentControl?.setWidth(120, forSegmentAt: i)
        }
        segmentControl?.sizeToFit()
        segmentControl?.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        segmentControl?.selectedSegmentIndex = 1
        segmentControl?.sendActions(for: .valueChanged)
        navigationItem.titleView = segmentControl
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            store?.fetchByDate()
        case 1:
            store?.fetchByFavorite()
        default:
            store?.fetchByFavorite()
        }
        animateItemTransition()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        print("segmentChanged: \(sender.selectedSegmentIndex)")
    }
}

