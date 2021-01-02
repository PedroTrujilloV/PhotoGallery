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
        getPhotoLibraryPermission()
        setup()
    }
    
    func setup(){
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor.systemIndigo
        navigationItem.title = "PhotoGallery"
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.cellReuseID)
    }
    
    func setupDatasource(){
        store = PhotoStore()
        store?.fetchByFavorite()
//        store?.fetchByDate()
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


extension ViewController { // getPhotoLibraryPermission
    
    func getPhotoLibraryPermission() {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        if  authStatus == .denied {
            presentSettingsAlert()
        } else if authStatus == .restricted  {
            presentSettingsAlert()
        } else if authStatus == .notDetermined {
            PHPhotoLibrary.requestAuthorization {[weak self] (status) in
                print(status)
                if status != .authorized {
                    self?.getPhotoLibraryPermission()
                } else {
                    self?.setupDatasource()
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                }
            }
        } else
         if authStatus == .authorized {
            self.setupDatasource()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func presentSettingsAlert() {
        print("presentSettingsAlert")
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "App Access Denied", message: "PhotoGallery App needs access to photo library in order to work.", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }

                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                }
            }
            alert.addAction(settingsAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
        
}
