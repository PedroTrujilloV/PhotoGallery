//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/29/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup(){
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor.systemIndigo
        navigationItem.title = "Test"

    }


}

