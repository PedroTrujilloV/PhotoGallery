//
//  PhotoGalleryCollectionView.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 1/2/21.
//  Copyright © 2021 Pedro Trujillo V. All rights reserved.
//

import UIKit

class PhotoGalleryCollectionView: UICollectionView {
    
    init(frame: CGRect) {
        let layout = PhotoGalleryCollectionViewFlowLayout(frame: frame)
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.cellReuseID)
    }
    
    
    

}
