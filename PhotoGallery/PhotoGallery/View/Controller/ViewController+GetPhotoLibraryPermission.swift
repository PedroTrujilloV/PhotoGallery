//
//  ViewController+GetPhotoLibraryPermission.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 1/2/21.
//  Copyright © 2021 Pedro Trujillo V. All rights reserved.
//

import Foundation
import UIKit
import Photos

extension ViewController {
    
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
    
    func setupDatasource(){
        store = PhotoStore()
        store?.fetchByDate()
        store?.fetchByFavorite()
    }
    
    private func presentSettingsAlert() {
        print("presentSettingsAlert")
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "App Access Denied", message: "PhotoGallery App needs access to photo library in order to work.", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }

                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        //print("Settings opened: \(success)")
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
