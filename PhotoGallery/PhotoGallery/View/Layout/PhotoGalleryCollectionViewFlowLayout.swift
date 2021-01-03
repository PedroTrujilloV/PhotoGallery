//
//  PhotoGalleryCollectionViewFlowLayout.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 1/2/21.
//  Copyright © 2021 Pedro Trujillo V. All rights reserved.
//

import Foundation
import UIKit

class PhotoGalleryCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    static let spacing:CGFloat = 2
    static let columns = 3

    init(frame:CGRect) {
        super.init()
        self.sectionInset = UIEdgeInsets(top: 10, left: PhotoGalleryCollectionViewFlowLayout.spacing, bottom: 10, right: PhotoGalleryCollectionViewFlowLayout.spacing)
        self.minimumInteritemSpacing = PhotoGalleryCollectionViewFlowLayout.spacing
        self.minimumLineSpacing = PhotoGalleryCollectionViewFlowLayout.spacing
        let extraSpace = ( CGFloat(PhotoGalleryCollectionViewFlowLayout.columns) * PhotoGalleryCollectionViewFlowLayout.spacing ) + PhotoGalleryCollectionViewFlowLayout.spacing
        let sideLenght = ( frame.width - extraSpace ) / 3
        self.itemSize = CGSize(width: sideLenght, height: sideLenght)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
