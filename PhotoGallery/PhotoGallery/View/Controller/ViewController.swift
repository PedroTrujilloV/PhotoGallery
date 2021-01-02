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
    
    let spacing:CGFloat = 2
    let columns = 3
    private var store:PhotoStore?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getPhotoLibraryPermission()
    }
    
    func setup(){
        navigationItem.title = "Photo Gallery"
        collectionView = PhotoGalleryCollectionView(frame: collectionView.frame)
    }
    
    func setupDatasource(){
        store = PhotoStore()
//        store?.fetchByFavorite()
        store?.fetchByDate()
    }
    
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


