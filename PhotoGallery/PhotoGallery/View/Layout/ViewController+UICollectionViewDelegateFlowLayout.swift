//
//  ViewController+UICollectionViewDelegateFlowLayout.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 1/2/21.
//  Copyright © 2021 Pedro Trujillo V. All rights reserved.
//  Important: Use only for custom cell sizes

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout {
    /* // Uncoment to use for individual custome cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let extraSpace = ( CGFloat(PhotoGalleryCollectionViewFlowLayout.columns) * PhotoGalleryCollectionViewFlowLayout.spacing ) + PhotoGalleryCollectionViewFlowLayout.spacing
        let sideLenght = ( view.frame.width - extraSpace ) / 3
        return CGSize(width: sideLenght, height: sideLenght)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return PhotoGalleryCollectionViewFlowLayout.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return PhotoGalleryCollectionViewFlowLayout.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 10, left: PhotoGalleryCollectionViewFlowLayout.spacing, bottom: 10, right: PhotoGalleryCollectionViewFlowLayout.spacing)
    }
     */
     
}
