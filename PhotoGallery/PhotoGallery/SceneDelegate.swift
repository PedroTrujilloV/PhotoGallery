//
//  SceneDelegate.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/29/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import UIKit
import Photos

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        presentRootViewController(scene: scene)
    }
    
    func presentRootViewController(scene: UIScene) {
        DispatchQueue.main.async {
            if let windowScene = scene as? UIWindowScene {
                self.window = UIWindow(windowScene: windowScene)
                let rootVC = ViewController(collectionViewLayout: UICollectionViewFlowLayout())
                let navController = UINavigationController(rootViewController: rootVC)
                self.window?.rootViewController = navController
                self.window?.makeKeyAndVisible()
            }
        }
    }

}

